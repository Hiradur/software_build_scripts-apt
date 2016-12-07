# Compiles linrad
# assumes manual download of latest linrad source from
# http://www.sm5bsz.com/linuxdsp/linrad.htm
# adjust cd command below for the source code's folder name
#
# depending on your distribution/wishes you may want to
# edit the make target (use make for overview of make targets)

sudo apt-get install nasm

cd lir*
./configure
make xlinrad64 -j$(grep -c processor /proc/cpuinfo)
