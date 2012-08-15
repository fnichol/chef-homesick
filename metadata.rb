maintainer       "Fletcher Nichol"
maintainer_email "fnichol@nichol.ca"
license          "Apache 2.0"
description      "Installs/Configures homesick"
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          "0.3.2"

supports "ubuntu"
supports "debian"
supports "mac_os_x"
supports "openbsd"
supports "suse"

recipe "homesick", "Processes a list of homesick castles (which is empty by default)."
recipe "homesick::data_bag", "Fetches a list of homesick castles from a data bag item and appends it to the `node['homesick']['castles']` attribute for processing."
