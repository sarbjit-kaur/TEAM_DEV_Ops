scripts_home = node['tibco']['scripts_home']
tra_home = node['tibco']['tra']['tra_home']
script_name = node['tibco']['domain_create']['scriptname']

#cmd = Chef::ShellOut.new(
#                       %Q[ cd "#{tra_home}/bin";./domainutilitycmd -cmdFile "#{scripts_home}/#{scripts_name}"]
#                             ).run_command
#unless cmd.exitstatus == 0
#Chef::Application.fatal!(%Q[ Command \' cd "#{tra_home}/bin";./domainutilitycmd -cmdFile "#{scripts_home}/#{scripts_name}" \' failed ])
#end


tibco_domain "CreateDomain" do
  scripts_home scripts_home
  tra_home   tra_home
  script_name    script_name
  action :create
end
