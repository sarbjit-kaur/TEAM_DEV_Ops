arch = node['tibco']['rv']['arch']
rv_version = node['tibco']['rv']['rv_version']
installer_home = node['tibco']['installer_home']
scripts_home = node['tibco']['scripts_home']


if rv_version.instance_of? Fixnum
  rv_version = rv_version.to_s
end

Chef::Log.info "rv_version: #{rv_version}"

case rv_version
when "8.4.0"
  tarball_path = node['tibco']['rv']['8.4.0'][arch]['path']
  script_name = node['tibco']['rv']['8.4.0'][arch]['scriptname']
  execute_file_name = node['tibco']['rv']['8.4.0'][arch]['execute_file_name']
end


Chef::Log.info "tarball_path: #{tarball_path}"


tibco_ark "Rendezvous" do
  tarball_path   tarball_path
  installer_home installer_home
  scripts_home   scripts_home
  script_name    script_name
  execute_file_name execute_file_name
  action :install
end