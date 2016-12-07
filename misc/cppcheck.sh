#!/bin/sh

set -eu

# Build the latest release of the C/C++ code analysis tool cppcheck

mkdir -p ~/source-builds
cd ~/source-builds

git clone https://github.com/danmar/cppcheck

# checkout latest release (tag)
cd cppcheck
latesttag=$(git describe --tags)
git checkout ${latesttag}

make SRCDIR=build CFGDIR=cfg HAVE_RULES=yes CXXFLAGS="-O2 -DNDEBUG -Wall \
    -Wno-sign-compare -Wno-unused-function" -j$(nproc)

# example template:
# cppcheck . --enable=all --template="{file},{line},{severity},{id},{message}" \
#    2> cppcheck_out.txt
# also see manual:
# cppcheck.sourceforge.net/manual.pdf

