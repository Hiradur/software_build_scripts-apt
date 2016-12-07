# Compiles Dream software for decoding DRM radio

# precompiled dependencies
sudo apt-get update
sudo apt-get install svn libqt4-dev libqwt-dev zlib1g-dev \
portaudio19-dev libsndfile1-dev libfftw3-dev

# Dream
svn checkout svn://svn.code.sf.net/p/drm/code/ dream-src
cd dream-src/dream

qmake-qt4 -o Makefile dream.pro
make -j$(grep -c processor /proc/cpuinfo)
