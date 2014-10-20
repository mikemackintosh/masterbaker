#
# Cookbook Name: bartender
# Recipe Name: install
#
# Copyright 2013, Alex Howells <alex@howells.me>
#

remote_file "Bartender :: Download the software to #{Chef::Config[:file_cache_path]}/Bartender-#{node['apps']['bartender']['version']}.zip" do
  checksum node['apps']['bartender']['checksum']
  path "#{Chef::Config[:file_cache_path]}/Bartender-#{node['apps']['bartender']['version']}.zip"
  source "http://www.macbartender.com/Demo/Bartender.zip"
end

execute "Bartender :: Unzip the archive and install into /Applications" do
  cwd "/Applications/"
  command "unzip #{Chef::Config[:file_cache_path]}/Bartender-#{node['apps']['bartender']['version']}.zip"
  not_if { ::File.directory?("/Applications/Bartender.app") }
end