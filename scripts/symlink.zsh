#!/bin/zsh

NVIM=$HOME/.config/nvim
TARGET=$HOME/Documents/Igloo/dotfiles

function relink() {
  if [[ -f $2 ]]; then
    rm $2
  else echo $2 "doesn't exist!"
  fi

  ln -s $1 $2
  echo "✓ Linked $2 to $1."
}

relink $NVIM/init.lua $TARGET/nvim/init.lua
relink $NVIM/plugins.lua $TARGET/nvim/plugins.lua
relink $NVIM/set.lua $TARGET/nvim/set.lua

echo "✓ Symlink complete."
