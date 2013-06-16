maintainer       "Fletcher Nichol"
maintainer_email "fnichol@nichol.ca"
name             "homesick"
license          "Apache 2.0"
description      "Chef library cookbook to manage Homesick castle repositories"
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          "0.4.1"

supports "ubuntu"
supports "debian"
supports "centos"
supports "scientific"
supports "mac_os_x"
supports "openbsd"
supports "suse"

depends "git"
