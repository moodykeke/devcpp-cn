/*********************************************************************
We define the Perfect Number is a positive integer that is equal to 
the sum of all its positive divisors except itself.

Write a function to check a number is a perfect number or not.
And write main function to put out pervect numbers in 2--10000.
(Only 4: 6, 28, 496 and 8128)
*********************************************************************/
#include <iostream>
using namespace std;

int isperfect(int n) {    //check if number n is a perfect number
    int k, sum = 0;
    for (k = 1;  k < n; k++)    
        if (n % k == 0)    //if k is a divisor of n
            sum += k;

    return (sum == n)? 1 : 0;
}

int main() {    
	cout << "perfect numbers less than 10000: "; 
    for (int n = 2; n < 10000; n++)
        if (isperfect(n))
            cout << n << "\t";
    return 0;
}
