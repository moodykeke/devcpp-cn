/*********************************************************************
说明：本程序中使用了 EGE 图形函数库进行绘图，运行时可以在屏幕上连续
绘制随机线条，直到用户按任意键结束。
需要在编译选项中加入一些连接参数才能成功编译。操作如下：点击Dev-C++ 
的菜单“工具”中的“编译选项”，在“在连接器命令行中加入以下命令”下方的
文本框中，根据编译器的配置而添加如下文字（实际上是要求在连接时把多个
函数库包含进来，并指定程序为图形界面）：
（A）如果当前使用的编译配置中包含有“64位”，则添加：
  -lgraphics64 -luuid -lmsimg32 -lgdi32 -limm32 -lole32 -loleaut32
（B）如果当前使用的编译配置中包含有“32位”，则添加：
  -lgraphics -luuid -lmsimg32 -lgdi32 -limm32 -lole32 -loleaut32
  （以后编译其它程序时需要在编译选项中删除以上命令）
*********************************************************************/

#include <iostream>
#include <ctime>        // 使用 time() 函数所需的库文件
#include <cstdlib>      // 使用随机数函数所需的库文件
#include <graphics.h>	//图形函数库 
using namespace std;

int main() {
	int x1, y1, x2, y2; 

	const int WIDTH = 640, HEIGHT = 480;
	initgraph(WIDTH, HEIGHT);	//初始化图形界面 

	srand(time(0));	//使用当前时间作为数值，设置随机数种子 
	x1 = rand() % WIDTH; 
	y1 = rand() % HEIGHT; 

	outtextxy(0, 0, "Random lines.  Press any key to stop");	//输出提示性文字 
	do  {
		//设置画图颜色。用 random 函数生成红、绿、蓝颜色分量，用 EGERGB 函数合成颜色。 
		setcolor(EGERGB(random(256),random(256), random(256)));
		x2 = rand() % WIDTH; 
		y2 = rand() % HEIGHT; 
		setlinestyle(SOLID_LINE, 0, rand()%10 + 1, NULL);	//设置线型 
		line(x1, y1, x2, y2);	//从(x1, y1)点画线到(x2, y2)点 
		x1 = x2; 
		y1 = y2;
		Sleep(100);	//暂停100毫秒 
	} while (!kbhit());		//直到用户在键盘按下任意键 

	return 0;
}
