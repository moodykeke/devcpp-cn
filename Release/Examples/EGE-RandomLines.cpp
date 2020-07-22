/*********************************************************************
Use EGE (Easy Graphic Engeer, https://xege.org/ ) graphic library to 
draw random lines on screen. 

Need to add some parameters to compiling options. Please click menu 
"Options > Compiler Options", in the textbox under "Add the following 
commands when calling the linker:", do as following:
(a) if the current compiler set contains "64-bit", add:
  -lgraphics64 -luuid -lmsimg32 -lgdi32 -limm32 -lole32 -loleaut32
(b) if the current compiler set contains "32-bit", add:
  -lgraphics -luuid -lmsimg32 -lgdi32 -limm32 -lole32 -loleaut32
  
(These parameters are only for programs using EGE graphic library.
Please delete them for other programs which donot use EGE.)
*********************************************************************/

#include <iostream>
#include <ctime>
#include <cstdlib>
#include <graphics.h>	//EGE graphic library
using namespace std;

int main() {
	int x1, y1, x2, y2; 

	const int WIDTH = 640, HEIGHT = 480;
	initgraph(WIDTH, HEIGHT);	//initialize graphic 

	srand(time(0));	//set random seed 
	x1 = rand() % WIDTH; 
	y1 = rand() % HEIGHT; 

	outtextxy(0, 0, "Random lines.  Press any key to stop");
	do  {
		//set RED, GREEN and BLUE volor value, and combine them with function "EGERGB"
		setcolor(EGERGB(random(256),random(256), random(256)));
		x2 = rand() % WIDTH; 
		y2 = rand() % HEIGHT; 
		setlinestyle(SOLID_LINE, 0, rand()%10 + 1, NULL);	//set line style 
		line(x1, y1, x2, y2);	//draw line from (x1, y1) to (x2, y2)
		x1 = x2; 
		y1 = y2;
		Sleep(100);	//pause for 100ms
	} while (!kbhit());		//until user press anykey 

	return 0;
}
