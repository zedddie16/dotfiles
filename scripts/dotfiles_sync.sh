#!/bin/bash

cd ~/.config || exit 1

NOW=$( date '+%F_%H:%M:%S' )
DOTFILES_DIR="$HOME/archbackup/dotfiles/"

cp -r ghostty $DOTFILES_DIR
cp -r kitty $DOTFILES_DIR
cp -r rofi $DOTFILES_DIR
cp -r tmux $DOTFILES_DIR
cp -r hypr $DOTFILES_DIR
cp -r ~/dev/scripts/ $DOTFILES_DIR
cp -r waybar $DOTFILES_DIR
cp cava/config "$DOTFILES_DIR/cava/"

cd $DOTFILES_DIR
git add .
git commit -m "Dotfiles Sync: $NOW"

