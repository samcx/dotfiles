#!/bin/zsh

NVIM=$HOME/.config/nvim
DOT=$HOME/Documents/Igloo/dotfiles

cp -r $NVIM $DOT/nvim

echo "✓ Completed syncing dotfiles."
