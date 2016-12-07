#!/bin/sh

set -eu

# Pokemon-like game Tuxemon

mkdir ~/source-builds
cd ~/source-builds

# Install dependencies
sudo apt-get install python python-pygame python-pip python-imaging python-six \
python-netifaces git

sudo pip install pytmx neteria

# Download premade archive with code and content
mkdir -p ~/source-builds
cd ~/source-builds
wget -c -O tuxemon.tgz https://tuxemon.org/files/builds/tuxemon-unstable-latest.tgz
tar xf tuxemon.tgz

echo "To run the game simply run inside Tuxemon's directory"
echo "python tuxemon.py"

