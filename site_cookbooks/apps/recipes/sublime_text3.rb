# Install

dmg_package 'Sublime Text' do
  volumes_dir 'Sublime Text3 Installer'
  source      "http://c758482.r82.cf2.rackcdn.com/Sublime%20Text%20Build%20#{node['apps']['sublime_text3']['version']}.dmg"
  checksum    "#{node['apps']['sublime_text3']['checksum']}"
  action      :install
end


sublime_path = "/Users/#{node['current_user']}/Library/Application Support/Sublime Text 3"
sublime_package_path = "#{sublime_path}/Packages"
sublime_user_path = "#{sublime_package_path}/User"
sublime_installed_packages_path = "#{sublime_path}/Installed Packages"

[sublime_path, sublime_package_path, sublime_user_path, sublime_installed_packages_path].each do |dir|
    directory dir do
        owner node['current_user']
        recursive true
    end
end

remote_file "#{sublime_installed_packages_path}/Package Control.sublime-package" do
    source 'http://sublime.wbond.net/Package%20Control.sublime-package'
    owner node['current_user']
    action :create_if_missing
end

link "/usr/bin/sublime" do
  to "/Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl"
end