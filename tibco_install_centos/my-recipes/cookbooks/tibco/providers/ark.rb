def parse_app_dir_name tarball_path
  file_name = tarball_path.split('/')[-1]

  app_dir_name = file_name.split(/(.tar.gz|.zip)/)[0]

  [app_dir_name, file_name]
end

action :install do

app_dir_name, tarball_name = parse_app_dir_name(new_resource.tarball_path)

Chef::Log.info "app_dir_name: #{app_dir_name} and tarball_name: #{tarball_name}"


require 'tmpdir'
tmpdir = Dir.mktmpdir
Chef::Log.info "Dir.mktmpdir: #{tmpdir}"

case tarball_name
   when /^.*\.zip/
      cmd = Chef::ShellOut.new(
                         %Q[ unzip "#{new_resource.tarball_path}" -d "#{tmpdir}" ]
                               ).run_command
      unless cmd.exitstatus == 0
        Chef::Application.fatal!("Failed to extract file #{tarball_name}!")
   end
   when /^.*\.tar.gz/
      cmd = Chef::ShellOut.new(
                         %Q[ tar xvzf "#{new_resource.tarball_path}" -C "#{tmpdir}" ]
                               ).run_command
      unless cmd.exitstatus == 0
        Chef::Application.fatal!("Failed to extract file #{tarball_name}!")
   end
end

    cmd = Chef::ShellOut.new(
                       %Q[ cp -rf "#{tmpdir}/#{new_resource.script_name}" "#{tmpdir}/#{new_resource.script_name}.backup"]
                             ).run_command
    unless cmd.exitstatus == 0
        Chef::Application.fatal!(%Q[ Command \' cp -rf "#{tmpdir}/#{new_resource.script_name}" "#{tmpdir}/#{new_resource.script_name}.backup" \' failed ])
    end

    cmd = Chef::ShellOut.new(
                       %Q[ rm -rf "#{tmpdir}/#{new_resource.script_name}"]
                             ).run_command
    unless cmd.exitstatus == 0
        Chef::Application.fatal!(%Q[ Command \' rm -rf "#{tmpdir}/#{new_resource.script_name}" \' failed ])
    end

    cmd = Chef::ShellOut.new(
                       %Q[ cp -rf "#{new_resource.scripts_home}/#{new_resource.script_name}" "#{tmpdir}/"]
                             ).run_command
    unless cmd.exitstatus == 0
        Chef::Application.fatal!(%Q[ Command \' cp -rf "#{new_resource.scripts_home}/#{new_resource.script_name}" "#{tmpdir}/" \' failed ])
    end


    cmd = Chef::ShellOut.new(
                       %Q[ chmod -R 755 #{tmpdir}; cd "#{tmpdir}"; ./#{new_resource.execute_file_name} -silent]
                             ).run_command
    unless cmd.exitstatus == 0
        Chef::Application.fatal!(%Q[ Command \' chmod -R 755 #{tmpdir}; cd "#{tmpdir}"; ./#{new_resource.execute_file_name} -silent \' failed ])
    end


    FileUtils.rm_r tmpdir

end

