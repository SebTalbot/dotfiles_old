#!/bin/bash

# Create symbolic links
mkdir -p ~/.config/i3
ln -f ./configs/i3/config ~/.config/i3/config

mkdir -p ~/.config/polybar
ln -f ./configs/polybar/config ~/.config/polybar/config
