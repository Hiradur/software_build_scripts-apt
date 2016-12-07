# Compiles linuxsampler and Fantasia as frontend (requires java, not installed by this script)
# thanks to http://davidbolton.info/articles/build_linuxsampler.html

sudo apt-get install subversion g++ debhelper pkg-config automake libtool fakeroot libsndfile1-dev doxygen uuid-dev lv2core lv2-dev bison libjack-jackd2-dev flex

# init
mkdir lssvn
cd lssvn
svn co https://svn.linuxsampler.org/svn/libgig/trunk libgig
svn co https://svn.linuxsampler.org/svn/linuxsampler/trunk linuxsampler

# libgig
cd libgig
dpkg-buildpackage -rfakeroot -b
cd .. 
sudo dpkg -i libgig6_3.3.0-6_amd64.deb
sudo dpkg -i gigtools_3.3.0-6_amd64.deb
sudo dpkg -i libgig-dev_3.3.0-6_amd64.deb

# linuxsampler
cd linuxsampler
dpkg-buildpackage -rfakeroot -b
make parser
cd ..
sudo dpkg -i liblinuxsampler_1.0.0-1_amd64.deb
sudo dpkg -i liblinuxsampler-dev_1.0.0-1_amd64.deb
sudo dpkg -i linuxsampler_1.0.0-1_amd64.deb

# GUI: Fantasia
sudo apt-get install default-jre
cd ~/Downloads
wget http://downloads.sourceforge.net/jsampler/Fantasia-0.9.jar
chmod a+x Fantasia-0.9.jar

echo "done"

