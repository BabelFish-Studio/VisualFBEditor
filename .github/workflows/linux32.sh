cd ..
cd ..
cd ..
git clone https://github.com/XusinboyBekchanov/MyFbFramework
apt install libgtk-3-dev
wget -O FreeBASIC-1.08.1-ubuntu-18.04-x86.tar.xz https://versaweb.dl.sourceforge.net/project/fbc/FreeBASIC-1.08.1/Binaries-Linux/ubuntu-18.04/FreeBASIC-1.08.1-ubuntu-18.04-x86.tar.xz
tar xf FreeBASIC-1.08.1-ubuntu-18.04-x86.tar.xz
cd FreeBASIC-1.08.1-ubuntu-18.04-x86
./install.sh -i
cd ..
cd VisualFBEditor/src
fbc "VisualFBEditor.bas" -x "../VisualFBEditor32_gtk3" -i "$PWD/../../MyFbFramework"
cd ..
cd ..
dir
cd MyFbFramework/mff
fbc -b "mff.bi" -dll -x "../libmff32_gtk3.so"
ls
cd ..
ls
