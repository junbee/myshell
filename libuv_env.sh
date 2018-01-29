echo "begin libuv_env.sh"
cd ~

yum -y install autoconf  automake  libtool  make   &&  \
wget https://github.com/libuv/libuv/archive/v1.19.1.tar.gz  &&  tar -xzf v1.19.1.tar.gz  &&  \
cd libuv-1.19.1   &&   sh autogen.sh   &&   ./configure  &&  make  &&  make install
ls /usr/local/lib/libuv*
ls /usr/local/include/uv*
cd ..
wget https://raw.githubusercontent.com/junbee/myshell/master/libuv_helloworld.c
gcc libuv_helloworld.c -o libuv_helloworld.exe  -L/usr/local/lib -luv  -Wl,-rpath=/usr/local/lib
chmod 755  libuv_helloworld.exe
./libuv_helloworld.exe

echo "end libuv_env.sh"
cd ~
