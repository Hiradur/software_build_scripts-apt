# Compiles SDR-J DABReceiver using the cmake build path
#
# assumes manual download of latest SDR-J DABReceiver source code from
# http://www.sdr-j.tk
# run this script from the folder the source folder of SDR-J is in 
# or adjust cd command below

# precompiled dependencies
sudo apt-get update
sudo apt-get install cmake libqwt-dev libqt4-dev portaudio19-dev \
librtlsdr-dev libfaad-dev libsndfile1-dev libsamplerate0-dev \
libfftw3-dev libusb-1.0-0-dev

# SDR-J DAB Receiver
cd sdr-j-dabreceiver-*/large-gui
cmake .
make -j$(grep -c processor /proc/cpuinfo)
