#
# Cookbook Name:: homesick
# Recipe:: data_bag
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

bag   = node['homesick']['data_bag']
users = begin
  data_bag(bag)
rescue => ex
  Chef::Log.info("Data bag #{bag.join('/')} not found (#{ex}), so skipping")
  []
end

include_recipe 'homesick'

Array(node['users']).each do |i|
  u = data_bag_item(bag, i)

  Array(u['homesick_castles']).each do |castle|
    homesick_castle castle['name'] do
      user    u['id']
      source  castle['source']         if castle['source']
      action  castle['action'].to_sym  if castle['action']
    end
  end
end
