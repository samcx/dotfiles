#!/bin/bash

NVIM = $HOME/.config/nvim

function mkdirs() {
  if [ ! -d $1 ]; then
    mkdir -p $1
    echo $1 "directory created"
  fi
}

function relink() {
  if [ -f $1 ]; then
    rm $1
    echo $1 "was deleted"
  else echo $1 "doesn't exist"
  fi

  ln -s $2 $1
  echo "Linked $2 to $1"
}

mdkirs $NVIM

relink $NVIM/init.lua $HOME/Documents/Igloo/dotfiles/nvim/init.lua
relink $NVIM/plugins.lua $HOME/Documents/Igloo/dotfiles/nvim/plugins.lua
relink $NVIM/set.lua $HOME/Documents/Igloo/dotfiles/nvim/set.lua

echo "symlink update complete"
