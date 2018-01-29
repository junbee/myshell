wget https://raw.githubusercontent.com/junbee/myshell/master/libuv_env.sh -qO- | bash -
wait

echo -e "\033[47;34mbegin libwebsockets_libuv_env.sh  ===============================\033[0m"

cd ~

yum -y install  gcc make cmake openssl-devel && \
wget https://github.com/warmcat/libwebsockets/archive/v2.4.1.tar.gz && \
tar -xzvf v2.4.1.tar.gz && \
cd libwebsockets-2.4.1 && \
mkdir build  && \
cd build     && \
cmake ..    -DLWS_WITH_LIBUV=ON  -DLWS_WITH_LEJP=ON   -DLWS_WITH_LEJP_CONF=ON   \
   -DLWS_LIBUV_LIBRARIES="/usr/local/lib/libuv.so" -DLWS_LIBUV_INCLUDE_DIRS="/usr/local/include"      && \
make         && \
make install

cd ~
wget https://raw.githubusercontent.com/junbee/myshell/master/myliblocal.conf  -O  /etc/ld.so.conf.d/myliblocal.conf
ldconfig

mkdir  /etc/lwsws
mkdir  /etc/lwsws/conf.d
wget https://raw.githubusercontent.com/junbee/myshell/master/etc-lwsws-conf-EXAMPLE  -O  /etc/lwsws/conf
wget https://raw.githubusercontent.com/junbee/myshell/master/etc-lwsws-conf.d-localhost-EXAMPLE  -O  /etc/lwsws/conf.d/localhost

wget https://raw.githubusercontent.com/junbee/myshell/master/libwebsockets_libuv_helloworld.c  -O  libwebsockets_libuv_helloworld.c
gcc libwebsockets_libuv_helloworld.c -o libwebsockets_libuv_helloworld.exe  -L/usr/local/lib -luv -lwebsockets   -Wl,-rpath=/usr/local/lib


echo -e "\033[47;34mend libwebsockets_libuv_env.sh  ===============================\033[0m"

./libwebsockets_libuv_helloworld.exe
