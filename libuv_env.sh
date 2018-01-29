echo ""
echo -e "\033[47;34mbegin libuv_env.sh  ===============================\033[0m"
echo ""
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

cd ~
echo ""
echo -e "\033[47;34mend libuv_env.sh  ===============================\033[0m"
echo ""
