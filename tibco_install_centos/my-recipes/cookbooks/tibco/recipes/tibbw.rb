arch = node['tibco']['bw']['arch']
bw_version = node['tibco']['bw']['bw_version']
installer_home = node['tibco']['installer_home']
scripts_home = node['tibco']['scripts_home']


if bw_version.instance_of? Fixnum
  bw_version = bw_version.to_s
end

Chef::Log.info "bw_version: #{bw_version}"

case bw_version
when "5.11.0"
  tarball_path = node['tibco']['bw']['5.11.0'][arch]['path']
  script_name = node['tibco']['bw']['5.11.0'][arch]['scriptname']
  execute_file_name = node['tibco']['bw']['5.11.0'][arch]['execute_file_name']
end


Chef::Log.info "tarball_path: #{tarball_path}"


tibco_ark "TibcoBusinessWorks" do
  tarball_path   tarball_path
  installer_home installer_home
  scripts_home   scripts_home
  script_name    script_name
  execute_file_name execute_file_name
  action :install
end