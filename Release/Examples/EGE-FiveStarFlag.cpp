/*********************************************************************
程序名：绘制五星红旗
版权：遵从GPL版权协议，可自由使用和传播（请勿上传到收费性网络文库）
作者：anbangli@foxmail.com
日期：2019-08-09
说明：依据“中国国旗尺寸颜色及绘制方法”编程。
      网址：https://www.douban.com/note/509127465/
程序中使用了 EGE 图形函数库（https://xege.org/）进行绘图。 
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

#include <stdio.h>
#include <time.h>
#include <graphics.h>
#include <math.h>

//#define PI 3.1415926	//在EGE图形函数库中已定义了常量 PI 
void paintstar(double x, double y, double radius, double rad) {
//绘制五角星：x 和 y 为中心坐标，radius 为外接圆半径，rad 为垂直偏转角度(单位为弧度) 
	int pt[10];	//五个 (x, y）坐标顶点，共10个数字
	for (int n = 0; n < 5; ++n) {	//根据几何知识设定五个顶点的 x 值和 y 值 
		pt[n*2] = (int)( x - cos( PI * 4 / 5 * n + rad + PI/2 ) * radius );
		pt[n*2+1] = (int)( y - sin( PI * 4 / 5 * n + rad + PI/2) * radius );
	}
	setcolor(YELLOW);	//设定线条颜色 
	setfillcolor(YELLOW);	//设定填充颜色 
	setrendermode(RENDER_MANUAL);
	fillpoly(5, pt);	//填充五角形（实际上只能填充外周的五个三角形）
	floodfill(x, y, YELLOW);	//填充五角星的中心区域
}

int main() {
	int width = 900, height = 600;	//中国国旗尺寸的长宽比例为3:2
	//setinitmode(INIT_ANIMATION and !INIT_WITHLOGO);	//设置图形初始化模式 
	initgraph(width, height);	// 图形初始化，指定窗口尺寸

	setfillcolor(RED);	//设置填充颜色 
	floodfill(10, 10, RED);	//全部填充为红色背景 

	int unit = width / 2 / 15; //绘图单位为窗口宽度的 1/30;

	//画法：先将旗面划分为4个等分长方形，再将左上方长方形划分长宽15x10个方格。
	//大五角星的中心位于该长方形上5下5、左5右10之处，外接圆半径为3单位长度。
	paintstar(unit * 5, unit * 5, unit * 3, 0);

	//四颗小五角星的中心点，第一颗位于上2下8、左10右5，第二颗位于上4下6、左12右3，
	//第三颗位于上7下3、左12右3，第四颗位于上9下1、左10右5之处。
	//每颗小五角星外接圆的直径均为1单位长度。四颗小五角星均有一角尖正对大五角星的中心点。
	paintstar(unit * 10, unit * 2, unit, 0.4);	//偏转角由手工调试而设定：0.4, 0.8, 0, 0.4 
	paintstar(unit * 12, unit * 4, unit, 0.8);
	paintstar(unit * 12, unit * 7, unit, 0);
	paintstar(unit * 10, unit * 9, unit, 0.4);

	getch(); 	//等待用户按任意键之后继续 

	//以下代码用于检查图形是否符合需要 
	//画网格线定位：先将旗面划分为4个等分长方形，再将左上方长方形划分长宽15x10个方格。
	setcolor(WHITE);
	line(width/2, 0, width/2, height);
	line(0, height/2, width, height/2);
	for(int k = 0; k < 10; k++)	//左上方长方形中画 10 条横线
		line(0, unit * k, width / 2, unit * k);
	for(int k = 0; k < 15; k++)	//左上方长方形中画 15 条竖线
		line(unit * k, 0, unit * k, height/2);
		
	//画出大五角星与四个小五角星的中心连线，以检查四个五角星是否对准大五角星的中心
	setcolor(CYAN);
	line(5 * unit, 5 * unit, 10 * unit, 2* unit);
	line(5 * unit, 5 * unit, 12 * unit, 4* unit);
	line(5 * unit, 5 * unit, 12 * unit, 7* unit);
	line(5 * unit, 5 * unit, 10 * unit, 9* unit);

	getch(); 	//等待用户按任意键之后结束程序 
	return 0;
}


