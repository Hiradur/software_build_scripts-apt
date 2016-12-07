# Compiles SDR-J SWReceiver
#
# assumes manual download of latest SDR-J SWReceiver source code from
# http://www.sdr-j.tk
# run this script from the folder the source folder of SDR-J is in 
# or adjust cd command below
#
# manual at http://www.sdr-j.tk/sdr-j-sw-manual-6.0.pdf

# precompiled dependencies
sudo apt-get update
sudo apt-get install gcc g++ \
libqt4-dev libqwt libqwt-dev \
libfftw3-3 libfftw3-dev \
alsa-base libasound2 libasound2-dev alsa-utils libasound2-plugins \
libportaudio2 libportaudio19-dev \
libsndfile1 libsndfile1-dev \
libsamplerate0 libsamplerate0-dev \
libusb-1.0-0 libusb-1.0-0-dev \
libftdi1 libftdi-dev

# SDR-J SW Receiver
cd sdr-j-swreceiver-*

# configurator
cd configurator
qmake-qt4
cmake .
make -j$(grep -c processor /proc/cpuinfo)
cd ..

# plugins
cd swreceiver/plugins
cd input
sh "create-for-linux"
cd ../decoders
sh "create-decoders-linux"
cd ../../

# receiver
# compatibility fix for qwt 6.0.1
cd src/scopes-qwt6/
sed -i 's/setMajorPen/setMajPen/g' scope.cpp
sed -i 's/setMinorPen/setMinPen/g' scope.cpp
cd ../../

qmake-qt4 -o Makefile sdr-j-swradio-60.pro
make -j$(grep -c processor /proc/cpuinfo)
