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

include_recipe 'homesick'

bag = node['homesick']['data_bag_name']

# Fetch the user array from the node's attribute hash. If a subhash is
# desired (ex. node['base']['user_accounts']), then set:
#
#     node['homesick']['user_array_node_attr'] = "base/user_accounts"
user_array = node
node['homesick']['user_array_node_attr'].split("/").each do |hash_key|
  user_array = user_array.send(:[], hash_key)
end

# only manage the subset of users defined
Array(user_array).each do |i|
  u = data_bag_item(bag, i.gsub(/[.]/, '-'))

  Array(u['homesick_castles']).each do |castle|
    homesick_castle castle['name'] do
      user    u['id']
      source  castle['source']         if castle['source']
      action  castle['action'].to_sym  if castle['action']
    end
  end
end
