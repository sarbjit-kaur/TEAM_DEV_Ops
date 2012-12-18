#
# Cookbook Name:: tibco
# Recipe:: default
#
# Copyright 2012, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

#include_recipe "tibco::rv"
include_recipe "tibco::#{node['tibco']['rv']['install_flavor']}"

#include_recipe "tibco::tra"
include_recipe "tibco::#{node['tibco']['tra']['install_flavor']}"

#include_recipe "tibco::bw"
include_recipe "tibco::#{node['tibco']['bw']['install_flavor']}"

#include_recipe "tibco::admin"
include_recipe "tibco::#{node['tibco']['admin']['install_flavor']}"

#include_recipe "tibco::createdomain"
include_recipe "tibco::#{node['tibco']['domain_create']['install_flavor']}"
