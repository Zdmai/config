#! /usr/bin/env zsh

echo "$(whoami) ALL=(root) NOPASSWD: sha256:$(shasum -a 256 $(which yabai) | cut -d " " -f 1) $(which yabai) --load-sa" | sudo tee /private/etc/sudoers.d/yabai

echo -e "\033[33mupdate the yabai's sha256 code\033[0m"

