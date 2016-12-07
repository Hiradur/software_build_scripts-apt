#!/bin/sh
set -eu

# Build Voxelands, a Minecraft clone

mkdir -p ~/source-builds
cd ~/source-builds

# Install dependencies
sudo apt-get install build-essential libirrlicht-dev cmake libbz2-dev libpng-dev libxxf86vm-dev libgl1-mesa-dev libsqlite3-dev libogg-dev libvorbis-dev libopenal-dev libfreetype6-dev git libjpeg62-turbo-dev

git clone https://gitlab.com/voxelands/voxelands.git
cd voxelands

# start build
cmake . \
    -DBUILD_SERVER=0 \
    -DBUILD_CLIENT=1 \
    -DCPU_OPTS=1 \
    -DENABLE_AUDIO=1

make -j$(nproc)

echo "You can start the game by running"
echo "~/source-builds/voxelands/bin/voxelands"

