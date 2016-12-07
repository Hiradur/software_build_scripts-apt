#!/bin/sh

set -eu

# Build the The Settlers 2 engine reimplementation Return To The Roots 
# Assets have to be provided manually

mkdir -p ~/source-builds
cd ~/source-builds

sudo apt-get update
sudo apt-get install cmake git libboost-dev libsdl1.2-dev libsdl-mixer1.2-dev \
    libcurl4-openssl-dev libbz2-dev libminiupnpc-dev liblua5.2-dev

git clone --recursive https://github.com/Return-To-The-Roots/s25client

cd s25client
cmake --prefix=.
make -j$(nproc)

# to run:
# copy original game data to ~/source-builds/s25client/S2
# to start the game:
# ./rttr.sh

