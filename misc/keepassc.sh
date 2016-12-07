# Build and install keepassc, an ncurses-based password manager compatible with Keepass v1.x databases

set -eu

sudo apt-get install python3 python-crypto xsel

mkdir ~/keepassc
cd ~/keepassc

git clone --depth 1 https://github.com/raymontag/kppy
git clone --depth 1 https://github.com/raymontag/keepassc.git

cd kppy
python3 setup.py build
sudo python3 setup.py install
cd ..

cd keepassc
python3 setup.py build
sudo python3 setup.py install

sudo mkdir -m 755 /var/empty
