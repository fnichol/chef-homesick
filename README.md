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

# Installation

Depending on the situation and use case there are several ways to install
this cookbook. All the methods listed below assume a tagged version release
is the target, but omit the tags to get the head of development. A valid
Chef repository structure like the [Opscode repo][chef_repo] is also assumed.

## From the Opscode Community Platform

To install this cookbook from the Opscode platform, use the *knife* command:

    knife cookbook site install homesick

## Using Librarian

The [Librarian][librarian] gem aims to be Bundler for your Chef cookbooks.
Include a reference to the cookbook in a **Cheffile** and run
`librarian-chef install`. To install with Librarian:

    gem install librarian
    cd chef-repo
    librarian-chef init
    cat >> Cheffile <<END_OF_CHEFFILE
    cookbook 'homesick',
      :git => 'git://github.com/fnichol/chef-homesick.git', :ref => 'v0.2.2'
    END_OF_CHEFFILE
    librarian-chef install

## Using knife-github-cookbooks

The [knife-github-cookbooks][kgc] gem is a plugin for *knife* that supports
installing cookbooks directly from a GitHub repository. To install with the
plugin:

    gem install knife-github-cookbooks
    cd chef-repo
    knife cookbook github install fnichol/chef-homesick/v0.2.2

## As a Git Submodule

A common practice (which is getting dated) is to add cookbooks as Git
submodules. This is accomplishes like so:

    cd chef-repo
    git submodule add git://github.com/fnichol/chef-homesick.git cookbooks/homesick
    git submodule init && git submodule update

**Note:** the head of development will be linked here, not a tagged release.

## As a Tarball

If the cookbook needs to downloaded temporarily just to be uploaded to a Chef
Server or Opscode Hosted Chef, then a tarball installation might fit the bill:

    cd chef-repo/cookbooks
    curl -Ls https://github.com/fnichol/chef-homesick/tarball/v0.2.2 | tar xfz - && \
      mv fnichol-chef-homesick-* homesick

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
user        |The user using the castle. |`nil`
source      |The clone URL (http, https, git, etc.) of the castle. |`nil`

### Examples

#### Install a Castle

    homesick_castle 'dotvim' do
      user    'wigglebottom
      source  'git://github.com/fnichol/dotvim.git'
    end

**Note:** the install action is the default.

#### Pull Updates for a Castle

    homesick_castle 'dotfiles' do
      user    'wigglebottom
      source  'git://github.com/fnichol/dotfiles.git'
      action  :update
    end

# Development

* Source hosted at [GitHub][repo]
* Report issues/Questions/Feature requests on [GitHub Issues][issues]

Pull requests are very welcome! Make sure your patches are well tested.
Ideally create a topic branch for every separate change you make.

# License and Author

Author:: [Fletcher Nichol][fnichol] (<fnichol@nichol.ca>) [![endorse](http://api.coderwall.com/fnichol/endorsecount.png)](http://coderwall.com/fnichol)

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

[chef_repo]:    https://github.com/opscode/chef-repo
[homesick]:     https://github.com/technicalpickles/homesick
[kgc]:          https://github.com/websterclay/knife-github-cookbooks#readme
[librarian]:    https://github.com/applicationsonline/librarian#readme
[rvm]:          http://rvm.beginrescueend.com
[rvm_cb]:       https://github.com/fnichol/chef-rvm

[repo]:         https://github.com/fnichol/chef-homesick
[issues]:       https://github.com/fnichol/chef-homesick/issues
