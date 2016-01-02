#
# Cookbook Name:: homesick
# Recipe:: default
#
# Copyright 2011, Fletcher Nichol
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

include_recipe "git"

chef_gem 'homesick' do
  compile_time false if Chef::Resource::ChefGem.method_defined?(:compile_time)
  version node['homesick']['gem_version'] if node['homesick']['gem_version']
end
