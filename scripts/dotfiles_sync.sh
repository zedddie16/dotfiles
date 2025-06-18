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
cp ~/.zshrc $DOTFILES_DIR

cp /home/tuturuu/.config/Cursor/User/keybindings.json $DOTFILES_DIR/cursor/
cp /home/tuturuu/.config/Cursor/User/settings.json $DOTFILES_DIR/cursor/



cd $DOTFILES_DIR
git add .
git commit -m "Dotfiles Sync: $NOW"

