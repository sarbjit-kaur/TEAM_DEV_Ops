scripts_home = node['tibco']['scripts_home']
tra_home = node['tibco']['tra']['tra_home']
scripts_name = node['tibco']['domain_create']['scriptname']

cmd = Chef::ShellOut.new(
                       %Q[ cd "#{tmpdir}/bin";./domainutilitycmd -cmdFile "#{scripts_home}/#{scripts_name}"]
                             ).run_command
unless cmd.exitstatus == 0
Chef::Application.fatal!(%Q[ Command \' cd "#{tmpdir}/bin";./domainutilitycmd -cmdFile "#{scripts_home}/#{scripts_name}" \' failed ])
end



