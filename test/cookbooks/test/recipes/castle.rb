include_recipe "homesick"

user 'atreyu' do
  home '/home/atreyu'
  shell '/bin/bash'
  supports :manage_home => true
end

homesick_castle 'dotfiles' do
  user 'atreyu'
  source 'git://github.com/fnichol/dotfiles.git'
end
