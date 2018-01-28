
yum -y install autoconf  automake  libtool  make  && \
wget https://github.com/libuv/libuv/archive/v1.19.1.tar.gz  &&  tar -xzf v1.19.1.tar.gz  &&  \
cd libuv-1.19.1   &&   sh autogen.sh   &&   ./configure  &&  make  &&  make check  ||  make install  ||  \
ls /usr/local/lib/libuv*  || \
ls /usr/local/include/uv*
