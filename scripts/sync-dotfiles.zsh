#!/bin/zsh

NVIM=$HOME/.config/nvim
TARGET=$HOME/Documents/Igloo/dotfiles

function relink() {
  cp $1 $2
}

relink $NVIM/init.lua $TARGET/nvim/init.lua
relink $NVIM/plugins.lua $TARGET/nvim/plugins.lua
relink $NVIM/set.lua $TARGET/nvim/set.lua

echo "✓ Completed syncing dotfiles."
