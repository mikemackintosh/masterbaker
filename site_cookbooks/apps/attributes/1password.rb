default['apps']['1password']['version'] = "5.0.1"
default['apps']['1password']['checksum'] = "864a28cb7658281b365fa7769adab534a44895f1"

# Licensing
default['apps']['1password']['name'] = "A N Other"
default['apps']['1password']['serial'] = "LIC-EN-SE"
default['apps']['1password']['license_data'] = { "Person" => node['apps']['1password'].name, "Serial" => node['apps']['1password'].serial }

# Keychain Backups
default['apps']['1password']['settings']['backup_path'] = "#{File.expand_path('~/Dropbox/Backups/1Password')}"
default['apps']['1password']['settings']['backup_retain_days'] = '10'

# Keychain Settings
default['apps']['1password']['settings']['keychain_path'] = "#{File.expand_path('~/Dropbox/1Password/1Password.agilekeychain')}"
default['apps']['1password']['settings']['keychain_lock_mins'] = '30'

# Software Updates
default['apps']['1password']['settings']['update_frequency_days'] = '1'
default['apps']['1password']['settings']['allow_beta_updates'] = true

# Other Settings
default['apps']['1password']['settings']['clipboard_clear_secs'] = '30'
default['apps']['1password']['settings']['disable_animations'] = true