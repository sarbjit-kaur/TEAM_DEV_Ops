arch = node['tibco']['tra']['arch']
tra_version = node['tibco']['tra']['tra_version']
installer_home = node['tibco']['installer_home']
scripts_home = node['tibco']['scripts_home']


if tra_version.instance_of? Fixnum
  tra_version = tra_version.to_s
end

Chef::Log.info "tra_version: #{tra_version}"

case tra_version
when "5.8.0"
  tarball_path = node['tibco']['tra']['5.8.0'][arch]['path']
  script_name = node['tibco']['tra']['5.8.0'][arch]['scriptname']
  execute_file_name = node['tibco']['tra']['5.8.0'][arch]['execute_file_name']
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