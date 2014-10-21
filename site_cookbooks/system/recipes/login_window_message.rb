unless node['system']['login_window_message'].nil?
  mac_os_x_userdefaults "Setting login screen message" do
    domain "com.apple.loginwindow"
    global true
    key "LoginWindowText"
    value node['system']['login_window_message']
  end
end
