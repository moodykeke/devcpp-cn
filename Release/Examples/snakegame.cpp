/******************
***C语言贪吃蛇 ***
***作者:iimT*******
***2016/12/12****
*******************/
/*********************************************************************
贪吃蛇游戏：在游戏场地上随机出现食物，玩家通过上下左右光标键控制一条蛇
的头部，使蛇在场地上行走，碰到食物就会吃掉，蛇身增长一节。
要求避免让蛇撞到场地四周的墙，撞到时游戏结束。
*********************************************************************/

#include <stdio.h>
#include <conio.h>
#include <stdlib.h>
#include <time.h>
#include <windows.h>	//Windows系统中关于窗口的所有属性和函数调用的头文件 

const int MapWid = 38; //地图宽度
const int MapHt = 20;//地图高度

char map[MapHt][MapWid];//定义地图
char key;//用来保存用户操作时输入的键值
int sleeptime = 200;	//程序内部循环的间隔时间（以ms为单位），用于控制游戏速度

int direct = 4;//蛇当前的运动方向：上 1，下 2，左 3，右 4
int food[2] = {9,11};//food[0]食物横坐标  food[1]食物纵坐标

int snake[400][3];//蛇的所有坐标点以及蛇。[i][0]为坐标x值，[i][1]为坐标y值，[i][2]为蛇头或蛇身的字符值
//[0][]为蛇尾，向右为蛇头方向
int head = 0; //蛇头在数组中的坐标（蛇的长度为 head+1）

void Init();//游戏开始的时候初始化
void MoveSnake(int direct);//让蛇的坐标进行移动
void MakeFood(int food[]);//生成随机数制作一个食物坐标
void DrawMap();  //仅绘出地图
void DrawSnake();  //绘出蛇和食物
int ifBump();//判断是否会相撞(撞自己或撞墙)
void getKey();//读取键值并重新设置运动方向

//在制作终端窗口的游戏时，需要在屏幕上精确定位并输出数据，
//所以需要自定义相应的函数 gotoxy、HideCursor和 ShowCursor
//这三个函数要用到结构体和Windows编程中的知识，初学者不必弄懂
//屏幕左上角为(0,0)，横向向右为 X 轴，竖向向下为 Y 轴
void gotoxy(int x, int y) { //定位光标位置到(x,y)
	COORD coord;	//定义结构体coord (坐标系coord)
	coord.X = x;
	coord.Y = y;
	HANDLE handle = GetStdHandle(STD_OUTPUT_HANDLE);
	//定义句柄变量handle并获取控制台输出句柄(值为-11)
	SetConsoleCursorPosition(handle, coord); //移动光标到(x,y)
}

void HideCursor() { //隐藏光标
	CONSOLE_CURSOR_INFO cursor_info = {1, 0};
	SetConsoleCursorInfo(GetStdHandle(STD_OUTPUT_HANDLE),&cursor_info);
}

void ShowCursor() { //显示光标
	CONSOLE_CURSOR_INFO cursor_info = {20, 1};
	SetConsoleCursorInfo(GetStdHandle(STD_OUTPUT_HANDLE),&cursor_info);
}

//////////////////////////////////////////////////////////////////////////////
int main() {
	Init();	//初始化
	srand(time(0));	//初始化随机数种子
	HideCursor();	//隐藏光标

	DrawMap();		//绘制地图
	DrawSnake();	//绘制蛇和食物
	while (1) {
		getKey();	//获取用户按键 !!!
		MoveSnake(direct);//让蛇开始移动 !!!

		if (!food[0] && !food[1]) { //食物已经被吃掉，则重新生成食物
			MakeFood(food);//生成食物坐标
		}
		DrawSnake();	//绘制蛇和食物

		if (ifBump()) {	//如果相撞
			gotoxy(MapWid/4, MapHt/2-3);
			ShowCursor();
			printf("游戏结束，你的成绩为：%d", head);
			break;
		}
		Sleep(sleeptime);
		getKey();
	}
	getch();
	gotoxy(0, MapHt);
	return 0;
}

void Init() { //初始化
	//初始化蛇。//蛇尾为一个空白字符，以便绘制时能清除原有蛇尾
	snake[0][0] = 5, snake[0][1] = 9, snake[0][2] = ' ';
	snake[1][0] = 6, snake[1][1] = 9, snake[1][2] = '#';
	snake[2][0] = 7, snake[2][1] = 9, snake[2][2] = '#';
	snake[3][0] = 8, snake[3][1] = 9, snake[3][2] = '@';//蛇头
	head = 3;

	//初始化地图
	for (int i = 0; i< MapHt; i++) {
		for (int j = 0; j< MapWid; j++) {
			if (i == 0 || j == 0 || i == MapHt - 1 || j == MapWid - 1) {
				map[i][j] = '*';
			} else {
				map[i][j] = ' ';
			}
		}
	}
	//在地图顶部显示游戏名称 "SNAKE"
	char title[] = "SNAKE";
	int n = sizeof(title)/sizeof(title[0])-1;
	int k = MapWid/2 - n/2;
	for (int i=0; i < n; i++)
		map[0][k+i] = title[i];
}

void DrawMap() { //根据map数组中存的值打印出来
	for (int i = 0; i < MapHt; i++) {
		for (int j = 0; j< MapWid; j++) {
			//gotoxy(j,i);
			printf("%c%c", map[i][j],map[i][j]);
		}
		printf("\n");
	}
}

void DrawSnake() { //绘制蛇
	int i;
	//重新绘制蛇
	for (i = 0; i <= head; i++) {	//下标0为蛇尾，下标增大为蛇头方向
		gotoxy(snake[i][0]*2, snake[i][1]);
		switch(snake[i][2]) {
			case '@':
				printf("＠");
				break;
			case '#':
				printf("＃");
				break;
			case ' ':
				printf("  ");
				break;
			default:
				break;
		}

	}
	//顺便重新绘制食物
	gotoxy(food[0]*2, food[1]);
	printf("()");
}

void MoveSnake(int direct) { //让蛇的坐标开始移动
	//先保留蛇头的坐标，以便后续使用
	int x = snake[head][0];
	int y = snake[head][1];

	switch (direct) {
		case 1://向上
			snake[head][1]--;//横坐标不变，纵坐标-1
			break;
		case 2://向下
			snake[head][1]++;//横坐标不变，纵坐标+1
			break;
		case 3://向左
			snake[head][0]--;//纵坐标不变，横坐标-1
			break;
		case 4://向右
			snake[head][0]++;//纵坐标不变，横坐标+1
			break;
	}
	//蛇头已经到了下一个位置，先判断是否会吃掉食物，接下来将之前所有的身体放到前一个的位置上

	if (snake[head][0] == food[0] && snake[head][1] == food[1] ) { //吃到食物，蛇增长1，更新蛇头和蛇颈
		snake[head][2] = '#'; //原来的蛇头变为蛇颈
		snake[head][0] = x;	//蛇颈获得原来蛇头的x和y坐标
		snake[head][1] = y;
		head ++;	//蛇长增1，然后设定新的蛇头
		snake[head][0] = food[0];
		snake[head][1] = food[1];
		snake[head][2] = '@';
		food[0] = 0, food[1] = 0;//将当前的food置空
	} else {	//没吃到食物，则整体移动
		for (int j = 0; j < head; j++) { //蛇身坐标更新
			snake[j][0] = snake[j+1][0];
			snake[j][1] = snake[j+1][1];
		}
		snake[head-1][0] = x;	//蛇颈更新为原先的蛇头位置
		snake[head-1][1] = y;
	}
}

void MakeFood(int food[]) { //生成一个食物的坐标
	int x, y, k, good;
	do {	//随机生成一个食物坐标，并检测是否与蛇身冲突。重复不冲突为止。
		x = rand() % (MapWid -2) + 1;
		y = rand() % (MapHt -2) + 1;//生成一个1-50的数作为横坐标  1-20的数作为纵坐标
		good = 1;
		for (k = 0; k <= head; k++) {
			if ((snake[k][0] == x && snake[k][1] == y)) //有冲突
				good = 0;
		}
	} while (!good);

	food[0] = x;
	food[1] = y;
}

int ifBump() {	//判断是否撞墙或撞到蛇身
	if ((snake[head][0]==0|| snake[head][0] == MapWid-1)
	        || (snake[head][1] == 0|| snake[head][1] == MapHt-1))//撞墙
		return 1;

	for (int i = 1; i < head-1; i++) {	//因为蛇尾是空白字符，所以只需判断 1 ~ head-1
		if ((snake[i][0] == snake[head][0] && snake[i][1] == snake[head][1])) { //撞到蛇身
			return 1;
		}
	}
	return 0;
}

void getKey() {
	if (kbhit()) {	//如果用户按了键，则获取键并作判断。否则不需处理
		key = getch();
		switch (key) {
			case 'H'://用户按 上 键
				if (direct != 2)
					direct = 1;
				break;
			case 'P'://用户按 下 键
				if (direct != 1)
					direct = 2;
				break;
			case 'K'://用户按 左 键
				if (direct != 4)
					direct = 3;
				break;
			case 'M'://用户按 右 键
				if (direct != 3)
					direct = 4;
				break;
		}
	}
}
