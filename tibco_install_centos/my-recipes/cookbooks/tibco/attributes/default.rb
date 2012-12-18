# default rv attributes
default['tibco']['installer_home'] = "/tmp/tibco"
default['tibco']['scripts_home'] = "/tmp/tibco/scripts"
default['tibco']['tra']['tra_home'] = "/opt/tibco/tra/5.8/"



default['tibco']['rv']['install_flavor'] = "tibrv"
default['tibco']['rv']['rv_version'] = "8.4.0"
default['tibco']['rv']['arch'] = kernel['machine'] =~ /x86_64/ ? "x86_64" : "i586"
default['tibco']['rv']['8.4.0']['x86_64']['path'] = "/tmp/tibco/TIB_rv_8.4.0_linux26gl23_x86.tar.gz"
default['tibco']['rv']['8.4.0']['x86_64']['scriptname'] = "TIBCOUniversalInstaller-rv.silent"
default['tibco']['rv']['8.4.0']['x86_64']['execute_file_name'] = "TIBCOUniversalInstaller-lnx-x86.bin"


default['tibco']['tra']['install_flavor'] = "tibtra"
default['tibco']['tra']['tra_version'] = "5.8.0"
default['tibco']['tra']['arch'] = kernel['machine'] =~ /x86_64/ ? "x86_64" : "i586"
default['tibco']['tra']['5.8.0']['x86_64']['path'] = "/tmp/tibco/TIB_tra_5.8.0_linux26gl23_x86_64.zip"
default['tibco']['tra']['5.8.0']['x86_64']['scriptname'] = "TIBCOUniversalInstaller_TRA_5.8.0.silent"
default['tibco']['tra']['5.8.0']['x86_64']['execute_file_name'] = "TIBCOUniversalInstaller-lnx-x86-64.bin"

default['tibco']['bw']['install_flavor'] = "tibbw"
default['tibco']['bw']['bw_version'] = "5.11.0"
default['tibco']['bw']['arch'] = kernel['machine'] =~ /x86_64/ ? "x86_64" : "i586"
default['tibco']['bw']['5.11.0']['x86_64']['path'] = "/tmp/tibco/TIB_bw_5.11.0_linux26gl23_x86_64.zip"
default['tibco']['bw']['5.11.0']['x86_64']['scriptname'] = "TIBCOUniversalInstaller-BW_5.11.0.silent"
default['tibco']['bw']['5.11.0']['x86_64']['execute_file_name'] = "TIBCOUniversalInstaller-lnx-x86-64.bin"


default['tibco']['admin']['install_flavor'] = "tibadmin"
default['tibco']['admin']['admin_version'] = "5.8.0"
default['tibco']['admin']['arch'] = kernel['machine'] =~ /x86_64/ ? "x86_64" : "i586"
default['tibco']['admin']['5.8.0']['x86_64']['path'] = "/tmp/tibco/TIB_TIBCOAdmin_5.8.0_linux26gl23_x86_64.zip"
default['tibco']['admin']['5.8.0']['x86_64']['scriptname'] = "TIBCOUniversalInstaller_TIBCOAdmin_5.8.0.silent"
default['tibco']['admin']['5.8.0']['x86_64']['execute_file_name'] = "TIBCOUniversalInstaller-lnx-x86-64.bin"

default['tibco']['domain_create']['install_flavor'] = "createdomain"
default['tibco']['domain_create']['scriptname'] = "CreateDomain.xml"