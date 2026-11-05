#!/usr/bin/env bash
config_file="$HOME/.config/hypr/lua/keybinding.lua"
echo "Reading from: $config_file"

# Lines look like: hl.bind(mainMod .. " + Q", <dispatcher>)  -- description
keybinds="$(sed -E 's/mainMod \.\. "/"SUPER/' "$config_file" \
    | sed -nE 's/^hl\.bind\("([^"]+)".*\) +-- (.*)$/\1  -  \2/p')"

sleep 0.2
rofi -theme ~/.config/rofi/launchers/type-1/style-11.rasi -dmenu -i -markup -eh 2 -replace -p "Keybinds" <<< "$keybinds"
