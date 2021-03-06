#!/bin/sh

set -eu

# Build the Minecraft-like game Minetest
# from https://forum.minetest.net/viewtopic.php?f=42&t=3837

sudo apt-get install -y git build-essential libirrlicht-dev libgettextpo0 libfreetype6-dev cmake libbz2-dev libpng12-dev libjpeg8-dev libxxf86vm-dev libgl1-mesa-dev libsqlite3-dev libogg-dev libvorbis-dev libopenal-dev libcurl4-openssl-dev libluajit-5.1-dev liblua5.1-0-dev libleveldb-dev; cd; git clone https://github.com/minetest/minetest.git; cd minetest/games; git clone https://github.com/minetest/minetest_game.git; cd ..; cmake . -DENABLE_GETTEXT=0 -DENABLE_FREETYPE=1 -DENABLE_LEVELDB=1; make -j$(nproc); minetest; echo -e "\n\n\e[1;33mYou can run Minetest again by typing \"minetest\" in a terminal or selecting it in an applications menu.\nYou can install mods in ~/.minetest/mods, too.\e[0m"
