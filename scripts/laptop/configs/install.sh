#!/bin/bash

# Create symbolic links
mkdir -p ~/.config/i3
ln -f ./i3/config ~/.config/i3/config

mkdir -p ~/.config/polybar
ln -f ./polybar/config ~/.config/polybar/config
