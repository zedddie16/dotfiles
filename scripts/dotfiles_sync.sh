#!/bin/bash

cd ~/.config || exit 1

DOTFILES_DIR="$HOME/archbackup/dotfiles/"

cp -r ghostty $DOTFILES_DIR
cp -r kitty $DOTFILES_DIR
cp -r rofi $DOTFILES_DIR
cp -r tmux $DOTFILES_DIR
cp -r hypr $DOTFILES_DIR
cp -r ~/dev/scripts/ $DOTFILES_DIR
cp -r waybar $DOTFILES_DIR

