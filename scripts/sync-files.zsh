#!/bin/zsh

DOT=$HOME/Documents/Igloo/dotfiles
NVIM=$HOME/.config/nvim
ZED=$HOME/Documents/Igloo/dotfiles/zed
ZED_KEYMAP=$HOME/.config/zed/keymap.json
ZED_SETTINGS=$HOME/.config/zed/settings.json

cp -r $NVIM $DOT
cp -r $ZED_KEYMAP $ZED
cp -r $ZED_SETTINGS $ZED

echo "✓ Completed syncing files."
