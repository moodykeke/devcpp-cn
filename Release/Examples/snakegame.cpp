/*********************************************************************
"Snake" is one of the most classic and popular casual games in the world, 
In the game, a player controls a snake, which is crawling in a compound 
wall which is usually the screen's boundaries. There appears random food
on the playground, and the strategy is to eat all of these food while 
ensuring a smooth movement by the snake. The snake's movement should not 
be restricted by an obstacle or its own body. While starting to play the 
game, managing the movement of your snake is very easy but when your snake 
eat various stuff placed on the screen, the snakes becomes bigger and 
navigation of the snake is very difficult.

贪吃蛇游戏：在游戏场地上随机出现食物，玩家通过上下左右光标键控制一条蛇
的头部，使蛇在场地上行走，碰到食物就会吃掉，蛇身增长一节。
要求避免让蛇撞到场地四周的墙，撞到时游戏结束。
*********************************************************************/

#include <stdio.h>
#include <conio.h>
#include <stdlib.h>
#include <time.h>
#include <windows.h>

const int MapWid = 38; //map width
const int MapHt = 20;  //map height

char map[MapHt][MapWid];	//map
char key;	//user-pressed key
int sleeptime = 200;	//time interval to control time speed

int direct = 4;	//the snake's moving direction. 1-up, 2-down, 3-left, 4-right
int food[2] = {9,11};	//food's coordinate: food[0] - X, food[1] - Y

int snake[400][3]; //information of the snake body.
//snake[i][0] - X, snake[i][1] - Y, snake[i][2] - char
//[0][] is the snake's tail, [head][] is the snake's head
//tail-body-body-...-body-neck-head
int head = 0; //snake's head (index in the array)

void Init();	//initialnize
void MoveSnake(int direct);	//move the snake
void MakeFood(int food[]);  //generate new food in random
void DrawMap();    //Draw the map
void DrawSnake();  //draw the snake and food
int isCrashed();	//check the snake crash to itself or to the walls
void getKey();  //get user inputed key and set the snake's movinig direction

//In the game, we need to output characters on a given point on the screen, 
//so these functions are needed: gotoxy, HideCursor and ShowCursor
//It uses some advanced programming skills. Beginners need not to understand.
//Corrdinate on up-left screen is (0,0). left-right is X, up-down is Y.
void gotoxy(int x, int y) { //locate the cursor to coordinate (x, y)
	COORD crd = {(short)x, (short)y};	//make coordinate (x, y) with x and y
	HANDLE handle = GetStdHandle(STD_OUTPUT_HANDLE);
	//define HANDEL variable handle and get the output handle of the console
	SetConsoleCursorPosition(handle, crd); //move the cursor to (x, y)
}

void HideCursor() { //Hide the cursor
	CONSOLE_CURSOR_INFO cursor_info = {1, 0};
	SetConsoleCursorInfo(GetStdHandle(STD_OUTPUT_HANDLE),&cursor_info);
}

void ShowCursor() { //Show the cursor
	CONSOLE_CURSOR_INFO cursor_info = {20, 1};
	SetConsoleCursorInfo(GetStdHandle(STD_OUTPUT_HANDLE),&cursor_info);
}

//////////////////////////////////////////////////////////////////////////////
int main() {
	Init();		//Initialize
	srand(time(0));	//initial random seed
	HideCursor();	

	DrawMap();		//Draw the map
	DrawSnake();	//draw the snake and food
	while (1) {
		getKey();	//get user-pressed key
		MoveSnake(direct);	//move the snake

		if (!food[0] && !food[1]) { //if food is eaten up, then generate nee food
			MakeFood(food);
		}
		DrawSnake();	//draw the snake and food

		if (isCrashed()) {	//if crashed, game over.
			gotoxy(MapWid/4, MapHt/2-3);
			ShowCursor();
			printf("GAME OVER, Your score is: %d", head);
			break;
		}
		Sleep(sleeptime);
		getKey();
	}
	getch();
	gotoxy(0, MapHt);
	return 0;
}

void Init() { //initialize
	//initialize the snake. 
	head = 3;	//initial snake length
	snake[0][0] = 5, snake[0][1] = 9, snake[0][2] = ' ';
	//snake tail is a space, which clears the previous last body.
	snake[1][0] = 6, snake[1][1] = 9, snake[1][2] = '#';	//body
	snake[2][0] = 7, snake[2][1] = 9, snake[2][2] = '#';	//body
	snake[3][0] = 8, snake[3][1] = 9, snake[3][2] = '@';	//head
	

	//initialize the map
	for (int i = 0; i< MapHt; i++) {
		for (int j = 0; j< MapWid; j++) {
			if (i == 0 || j == 0 || i == MapHt - 1 || j == MapWid - 1) {
				map[i][j] = '*';
			} else {
				map[i][j] = ' ';
			}
		}
	}
	//show "SNAKE" on the top of the map
	char title[] = "SNAKE";
	int n = sizeof(title)/sizeof(title[0])-1;
	int k = MapWid/2 - n/2;
	for (int i=0; i < n; i++)
		map[0][k+i] = title[i];
}

void DrawMap() { //draw the map (print out characters in map[][]
	for (int i = 0; i < MapHt; i++) {
		for (int j = 0; j< MapWid; j++) {
			printf("%c%c", map[i][j], map[i][j]);
		}
		printf("\n");
	}
}

void DrawSnake() { //Draw the snake and food
	int i;
	for (i = 0; i <= head; i++) {	//下标0为蛇尾，下标增大为蛇头方向
		gotoxy(snake[i][0]*2, snake[i][1]);
		switch(snake[i][2]) {
			case '@': printf("＠"); break; //head. print out Full-width characters
			case '#': printf("＃"); break; //body or neck. Full-width characters
			case ' ': printf("  ");	break; //tail
			default:  break;
		}
	}
	//draw the food
	gotoxy(food[0]*2, food[1]);
	printf("()");	//food
}

void MoveSnake(int direct) { //move the snake
	//keep the coordinate of snake head
	int x = snake[head][0];
	int y = snake[head][1];

	switch (direct) {  //move snake head to new position
		case 1:	//up
			snake[head][1]--; break;//Y--	
		case 2:	//down
			snake[head][1]++; break;//Y++
		case 3: //left
			snake[head][0]--; break;//X--
		case 4: //right
			snake[head][0]++; break;//X++
	}
	//check if the snake eat food
	if (snake[head][0] == food[0] && snake[head][1] == food[1] ) { //eat food
		snake[head][2] = '#'; //the old head become neck
		snake[head][0] = x;	//snake neck get the coordinate of old head
		snake[head][1] = y;
		head ++;	////snake length ++, then set the new head
		snake[head][0] = food[0];
		snake[head][1] = food[1];
		snake[head][2] = '@';
		food[0] = food[1] = 0;	//the current food is eaten
	} else {	//no food, update the whole snake body
		for (int j = 0; j < head; j++) { //update the snake body
			snake[j][0] = snake[j+1][0];
			snake[j][1] = snake[j+1][1];
		}
		snake[head-1][0] = x;	//snake neck update to the old head
		snake[head-1][1] = y;
	}
}

void MakeFood(int food[]) { //generate new food
	int x, y, k, good = 1;
	do {	//generate a new coordinate. 
		x = rand() % (MapWid -2) + 1;
		y = rand() % (MapHt -2) + 1;
		good = 1;
		for (k = 0; k <= head; k++) {	//check if the coordinate crash with the snake
			if ((snake[k][0] == x && snake[k][1] == y))
				good = 0;
		}
	} while (!good);

	food[0] = x;
	food[1] = y;
}

int isCrashed() {	//check the snake crash to itself or to the walls
	if ((snake[head][0]==0|| snake[head][0] == MapWid-1)
	        || (snake[head][1] == 0|| snake[head][1] == MapHt-1))//crash to the walls
		return 1;

	for (int i = 1; i < head-1; i++) 	//check crash to body, neck or head
		if ((snake[i][0] == snake[head][0] && snake[i][1] == snake[head][1]))  //crash to itself
			return 1;
			
	return 0;
}

void getKey() {
	if (kbhit()) {
		key = getch();
		switch (key) {
			case 'H': //up. 
				if (direct != 2) //the snake is moving left or right. it can't turn aroud.
					direct = 1;
				break;
			case 'P': //down
				if (direct != 1)
					direct = 2;
				break;
			case 'K': //left
				if (direct != 4)
					direct = 3;
				break;
			case 'M': //right
				if (direct != 3)
					direct = 4;
				break;
		}
	}
}
