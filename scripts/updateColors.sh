#!/usr/bin/env bash

if [ -z "$1" ]; then
  echo "❌ Set path to wallpapers: $0 <path_to_image>"
  exit 1
fi

WALLPAPER_PATH="$(realpath "$1")"

if [ ! -f "$WALLPAPER_PATH" ]; then
  echo "❌ No such file: $WALLPAPER_PATH"
  exit 1
fi

wal -q -i "$WALLPAPER_PATH"

swww img "$WALLPAPER_PATH"

echo "$WALLPAPER_PATH" > ~/.cache/current-wallpaper

python3 ~/nix/scripts/generateNixColors.py

home-manager switch --flake ~/nix --quiet --no-build-output

clear
neofetch