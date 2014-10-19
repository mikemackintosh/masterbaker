unless ::File.directory?("/Applications/iTerm.app")
  remote_file "#{Chef::Config[:file_cache_path]}/iTerm2_#{node['apps']['iterm2']['version']}.zip" do
    source "https://iterm2.com/downloads/stable/iTerm2_#{node['apps']['iterm2']['version']}.zip"
    checksum node['apps']['iterm2']['checksum']
  end

  execute "untar iTerm2" do
    command "unzip #{Chef::Config[:file_cache_path]}/iTerm2_#{node['apps']['iterm2']['version']}.zip"
    cwd "/Applications"
    not_if { File.directory?("/Applications/iTerm.app") }
  end
end