# Description

LWRP to manage [homesick][homesick] castles.

# Requirements

## Chef

Tested on 0.10.2 and 0.10.4 but newer and older version should work just fine.
File an [issue][issues] if this isn't the case.

## Platform

The following platforms have been tested with this cookbook, meaning that the
recipes run on these platforms without error:

* ubuntu
* debian
* mac_os_x
* suse
* openbsd

Please [report][issues] any additional platforms so they can be added.

## Cookbooks

There are **no** external cookbook dependencies. If you are using [RVM][rvm],
then you should consider using the [rvm cookbook][rvm_cb].

# Usage

Simply include `recipe[homesick]` in your run_list and the `homesick_repo`
resource will be available.

To use `recipe[homesick::data_bag]`, include it in your run_list and have a
data bag called `"users"` with an item for your user like the following:

    {
      "id"  : "wigglebottom",
      "homesick_castles"  : [
        { "name"    : "dotvim",
          "source"  : "git://github.com/fnichol/dotvim.git"
        },
        { "name"    : "dotfiles",
          "source"  : "git://github.com/fnichol/dotfiles.git",
          "action"  : "update"
        }
      ]
    }

The data bag recipe will iterate through a list of usernames defined in
`node['users']` and attempt to pull in the homesick information from the data
bag item. In other words, having:

    node['users'] = ['hsolo']

will set up the `hsolo` user's castles and not use the `wigglebottom` user.

# Recipes

## default

This recipe is a no-op and does nothing.

Use this recipe when you only want access to the `homesick_castle` LWRP.

## data_bag

Fetches an list of homesick castles with data drawn from a data bag. The
default data bag is `"users"` and the list of user accounts to iterate through
is set on `node['users']`.

Use this recipe when you want data bag driven data in your workflow.

# Attributes

## `data_bag`

The data bag name containing a group of user account information. This is used
by the `data_bag` recipe to use as a database of user accounts. The default is
`"users"`.

# Resources and Providers

## homesick_castle

### Actions

Action    |Description                   |Default
----------|------------------------------|-------
install   |Clones the castle and symlinks it. |Yes
update    |Pulls updates for the castle and re-symlinks it. |

### Attributes

Attribute   |Description |Default value
------------|------------|-------------
name        |**Name attribute:** The name of the homesick castle. |`nil`
source      |The clone URL (http, https, git, etc.) of the castle. |`nil`

### Examples

#### Install a Castle

    homesick_castle 'dotvim' do
      source  'git://github.com/fnichol/dotvim.git'
    end

**Note:** the install action is the default.

#### Pull Updates for a Castle

    homesick_castle 'dotfiles' do
      source  'git://github.com/fnichol/dotfiles.git'
      action  :update
    end

# Development

* Source hosted at [GitHub][repo]
* Report issues/Questions/Feature requests on [GitHub Issues][issues]

Pull requests are very welcome! Make sure your patches are well tested.
Ideally create a topic branch for every seperate change you make.

# License and Author

Author:: Fletcher Nichol (<fnichol@nichol.ca>)

Copyright 2011, Fletcher Nichol

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.

[homesick]:     https://github.com/technicalpickles/homesick
[rvm]:          http://rvm.beginrescueend.com
[rvm_cb]:       https://github.com/fnichol/chef-rvm

[repo]:         https://github.com/fnichol/chef-homesick
[issues]:       https://github.com/fnichol/chef-homesick/issues
