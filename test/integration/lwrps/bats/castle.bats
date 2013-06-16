#!/usr/bin/env bats

@test "creates dotfiles castle" {
  [ -d /home/atreyu/.homesick/repos/dotfiles ]
}
