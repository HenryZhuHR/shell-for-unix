BASE_DIR=$HOME/program
LIB_NAME=qt
VERSION=6.3.0-rc

SOURCE_DIR=$BASE_DIR/src/$LIB_NAME-everywhere-src-${VERSION}
# https://download.qt.io/development_releases/qt/6.3/6.3.0-rc/submodules/qtbase-everywhere-src-6.3.0-rc.tar.xz

DEFAULT=$(echo -en '\033[0m')
RED=$(echo -en '\033[00;31m')
GREEN=$(echo -en '\033[00;32m')

if [ ! -d $SOURCE_DIR ]; then
    echo "$RED--> Not found $LIB_NAME-$VERSION source: $SOURCE_DIR $DEFAULT"
    exit
fi
echo "$GREEN--> Found $LIB_NAME-$VERSION source: $SOURCE_DIR $DEFAULT"

# enter
cd $SOURCE_DIR
mkdir -p build
cd build
# rm CMakeCache.txt

# config
export Ninja_EXECUTABLE=/Users/henryzhu/program/ninjia/bin/ninja
INSTALL_PREFIX=$BASE_DIR/$LIB_NAME-$VERSION
cmake .. \
    -DCMAKE_INSTALL_PREFIX=$INSTALL_PREFIX \
    -DNinja_EXECUTABLE=$Ninja_EXECUTABLE \
    -DFEATURE_clang=ON -DFEATURE_clangcpp=ON

# exit
# make
NUM_CORES=`sysctl -n hw.ncpu`   # for Darwin
# NUM_CORES=`nproc --all`         # for Linux
make -j${NUM_CORES}
# make -j4

# install
make install

# clean
cd $SOURCE_DIR
rm -rf build

cd $BASE_DIR
rm -rf $SOURCE_DIR


# To configure and build other Qt modules, you can use the following convenience script:
#         /Users/henryzhu/program/qt-6.3.0-rc/bin/qt-configure-module