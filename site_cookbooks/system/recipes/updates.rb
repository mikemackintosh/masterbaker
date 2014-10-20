# This is a theoretically flawed chef recipe.  This installs anything apple thinks
# is a good idea.  Please understand why you shouldn't use this before using it.

mac_os_x_userdefaults "Set system updates frequency" do
  domain "com.apple.SoftwareUpdate"
  global true
  key "ScheduleFrequency"
  value 1
end