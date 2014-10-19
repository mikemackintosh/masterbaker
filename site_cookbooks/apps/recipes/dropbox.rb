dmg_package 'Dropbox' do
  volumes_dir 'Dropbox Installer'
  source      'https://www.dropbox.com/download?src=index&plat=mac'
  checksum    '9a7b04fb81501b07556afe4beac05d0794d66c9c'
  action      :install
end