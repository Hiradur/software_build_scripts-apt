#!/bin/sh

set -eu

# Install Cataclysm Dark Days Ahead, a roguelike set in an apocalyptic setting.

sudo apt-get install libncurses5-dev libncursesw5-dev build-essential

cd ~/

git clone --depth 1 https://github.com/CleverRaven/Cataclysm-DDA.git
cd "Cataclysm-DDA"

make -j$(nproc)

# to launch run
# cataclysm-launcher

