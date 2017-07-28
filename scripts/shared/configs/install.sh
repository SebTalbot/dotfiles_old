#!/bin/bash

# vis/
mkdir -p ~/.config/vis
ln -f ~/scripts/shared/configs/vis/config ~/.config/vis/config
mkdir -p ~/.config/vis/colors
ln -f ~/scripts/shared/configs/vis/colors/miami ~/.config/vis/colors/miami

# cmus/
mkdir -p ~/.config/cmus
ln -f ~/scripts/shared/configs/cmus/neon.theme ~/.config/cmus/neon.theme
