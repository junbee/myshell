#include <stdlib.h>
#include <stdio.h>
#include "uv.h"


int libuv_helloworld() {
	printf("in func libuv_helloworld()\r\n");

	//uv_loop_t* loop = uv_default_loop();
    uv_loop_t *loop = malloc(sizeof(uv_loop_t));  //uv_loop_t是一个结构体类型，这里分配一段这个类型长度的空间
    uv_loop_init(loop); //初始化loop这个结构体

    printf("Now uv_run.\r\n");
    uv_run(loop, UV_RUN_DEFAULT); //开始一个事件loop，第二个参数是模式，通常用DEFAULT这个，一般有3种可选：
    uv_loop_close(loop); //释放所有的循环内部的资源。只能在loop完成运行并且所有打开的handle以及requests已经被关闭，否则会返回UV_EBUSY。当本函数返回之后，用户可以释放为loop分配的内存了。
    free(loop);

    printf("Now exit.\r\n");
    return 0;
}



int main(int argc, char **argv){
    printf("in func main()\n");

	libuv_helloworld();

	return 0;
}
