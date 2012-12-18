arch = node['tibco']['admin']['arch']
admin_version = node['tibco']['admin']['admin_version']
installer_home = node['tibco']['installer_home']
scripts_home = node['tibco']['scripts_home']


if admin_version.instance_of? Fixnum
  admin_version = admin_version.to_s
end

Chef::Log.info "admin_version: #{admin_version}"

case admin_version
when "5.8.0"
  tarball_path = node['tibco']['admin']['5.8.0'][arch]['path']
  script_name = node['tibco']['admin']['5.8.0'][arch]['scriptname']
  execute_file_name = node['tibco']['admin']['5.8.0'][arch]['execute_file_name']
end


Chef::Log.info "tarball_path: #{tarball_path}"


tibco_ark "TibcoRuntimeAgent" do
  tarball_path   tarball_path
  installer_home installer_home
  scripts_home   scripts_home
  script_name    script_name
  execute_file_name execute_file_name
  action :install
end