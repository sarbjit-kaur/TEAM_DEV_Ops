action :create do

cmd = Chef::ShellOut.new(
                       %Q[ cd "#{new_resource.tra_home}/bin";./domainutilitycmd -cmdFile "#{new_resource.scripts_home}/#{new_resource.script_name}"]
                             ).run_command
unless cmd.exitstatus == 0
Chef::Application.fatal!(%Q[ Command \' cd "#{new_resource.tra_home}/bin";./domainutilitycmd -cmdFile "#{new_resource.scripts_home}/#{new_resource.script_name}" \' failed ])
end


end

