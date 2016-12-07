# build and install the messenger Toxic

set -eu

cd ~/
mkdir toxic
cd toxic

sudo apt-get install build-essential libtool autotools-dev automake checkinstall \
check git yasm libsodium-dev make \
libncursesw5-dev libconfig-dev libcurl4-openssl-dev \
libqrencode-dev libopenal-dev libalut-dev libnotify-dev \
libopus-dev libvpx-dev pkg-config

# build Tox core with AV
git clone https://github.com/irungentoo/toxcore.git
cd toxcore
autoreconf -i
./configure
make
sudo make install
cd ..

# build Toxic
git clone https://github.com/JFreegman/toxic.git
cd toxic
make PREFIX="/usr/local/"
sudo make install PREFIX="/usr/local/"