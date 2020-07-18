//输入某个年份，判断是否为闰年（能被4整除且不能100整除，或能被400整除）

#include<stdio.h>

int main() {
	int n;
	
	printf("please input a number：");
	scanf("%d",&n);
	if((n%4 ==0 && n%100 != 0) || n%400 == 0)
		printf("%d是闰年。\n", n);
	else 
		printf("%d不是闰年!\n", n);
	return 0;
}

