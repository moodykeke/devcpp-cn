//Input a year number, check it is a leap year or not. 
//(divide exactly by 4 but not by 100, or diveded exactly by 400)

#include <iostream>
using namespace std;

int main() {
	int n;
	
	cout << "please input a number£º");
	cin >> n;
	if((n%4 ==0 && n%100 != 0) || n%400 == 0)
		cout << year << " is a leapyear." << endl;
	else 
		cout << year << " in NOT a leapyear." << endl;
	return 0;
}

