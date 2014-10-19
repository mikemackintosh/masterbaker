name             "apps"
maintainer       "Mike Mackintosh"
maintainer_email "m@splug.io"
license          "Apache 2.0"
description      "Manage Apps for OSX"
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          "0.2.0"
supports         "apps"

depends "homebrew"
depends "dmg"