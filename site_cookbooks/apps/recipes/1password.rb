# Install
unless ::File.directory?("/Applications/1Password 5.app")
  remote_file "#{Chef::Config[:file_cache_path]}/1Password-#{node['apps']['1password']['version']}.zip" do
    source "https://d13itkw33a7sus.cloudfront.net/dist/1P/mac4/1Password-#{node['apps']['1password']['version']}.zip"
    checksum node['apps']['1password']['checksum']
  end

  execute "untar 1Password" do
    command "unzip #{Chef::Config[:file_cache_path]}/1Password-#{node['apps']['1password']['version']}.zip"
    cwd "/Applications"
    not_if { File.directory?("/Applications/1Password 5.app") }
  end
end

# Configure
osx_userdefaults "1Password :: License software for #{node['apps']['1password']['name']}" do
  domain "ws.agile.1Password"
  key "License"
  value node['apps']['1password']['license_data']
  not_if "defaults read #{ENV['HOME']}/Library/Preferences/ws.agile.1Password | grep -q License"
end

osx_userdefaults "1Password :: Keychain Path (#{node['apps']['1password']['settings']['keychain_path']})" do
  domain "ws.agile.1Password"
  key "AgileKeychainLocation"
  value node['apps']['1password']['settings']['keychain_path']
end

osx_userdefaults "1Password :: Lock keychain after #{node['apps']['1password']['settings']['keychain_lock_mins']} minutes" do
  domain "ws.agile.1Password"
  key "AgileKeychainLockTimeout"
  value node['apps']['1password']['settings']['keychain_lock_mins']
end

osx_userdefaults "1Password :: Look for updates every #{node['apps']['1password']['settings']['update_frequency_days']} days" do
  domain "ws.agile.1Password"
  key "AGUpdateFrequency"
  value node['apps']['1password']['settings']['update_frequency_days']
end

osx_userdefaults "1Password :: When checking for updates, do we accept beta code?" do
  domain "ws.agile.1Password"
  key "AGUpdateAllowBetas"
  value node['apps']['1password']['settings']['allow_beta_updates']
end

osx_userdefaults "1Password :: Backup Path (#{node['apps']['1password']['settings']['backup_path']})" do
  domain "ws.agile.1Password"
  key "keychainBackupFolderPath"
  value node['apps']['1password']['settings']['backup_path']
end

osx_userdefaults "1Password :: Retain backups for #{node['apps']['1password']['settings']['backup_retain_days']} days" do
  domain "ws.agile.1Password"
  key "keychainRotationFrequency"
  value node['apps']['1password']['settings']['backup_retain_days']
end

osx_userdefaults "1Password :: Retain data on clipboard for #{node['apps']['1password']['settings']['clipboard_clear_secs']} seconds" do
  domain "ws.agile.1Password"
  key "PasteboardClearTimeout"
  value node['apps']['1password']['settings']['clipboard_clear_secs']
end

osx_userdefaults "1Password :: Disable animations when locking and unlocking the keychain" do
  domain "ws.agile.1Password"
  key "DisableCoreAnimation"
  value node['apps']['1password']['settings']['disable_animations']
end