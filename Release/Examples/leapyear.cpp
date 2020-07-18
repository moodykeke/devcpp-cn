//Input a year number, judge if it is a leapyear
//输入某个年份，判断是否为闰年（能被4整除且不能100整除，或能被400整除）

#include <iostream>
using namespace std;

int main() {
	int n;
	
	cout << "please input a number：");
	cin >> n;
	if((n%4 ==0 && n%100 != 0) || n%400 == 0)
		cout << year << " is a leapyear." << endl;
	else 
		cout << year << " in NOT a leapyear." << endl;
	return 0;
}

