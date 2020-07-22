//Input a year number, check it is a leap year or not. 
//(divide exactly by 4 but not by 100, or diveded exactly by 400)

#include<stdio.h>

int main() {
	int n;
	
	printf("please input a number£º");
	scanf("%d",&n);
	if((n%4 ==0 && n%100 != 0) || n%400 == 0)
		printf("%d is a leap year¡£\n", n);
	else 
		printf("%d is NOT a leap year!\n", n);
	return 0;
}

