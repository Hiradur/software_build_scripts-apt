#!/bin/sh

set -eu

# Build the Age of Empires 2 engine reimplementation openage
# Assets have to be provided/converted manually

mkdir -p ~/source-builds
cd ~/source-builds

sudo apt-get update
sudo apt-get install cmake libfreetype6-dev python3-dev libepoxy-dev libsdl2-dev libsdl2-image-dev libopusfile-dev libfontconfig1-dev libharfbuzz-dev opus-tools python3-pil python3-numpy python3-pygments python3-pip qtdeclarative5-dev qml-module-qtquick-controls git
sudo pip3 install cython
git clone https://github.com/SFTtech/openage

cd openage
./configure --mode=release --compiler=gcc
make -j$(nproc)

# to run:
# ./run
# help:
# ./run --help
