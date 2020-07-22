/*********************************************************************
Fibonacci sequency: 1, 1, 2, 3, 4, 8, 13, 21, 34, 55, 89, 144, ...
Its recursion definition is:
  F1 = 1, F2 = 1, ... F_n = F_(n-1) + F_(n-2)   (n > 2)
Write a program using array to calculate the first 30 items. 
*********************************************************************/
#include <iostream>
using namespace std;

int main() {
    const int NUM = 30;
    long fib[NUM];
    int n;

    fib[0] = 1;
    fib[1] = 1;
    for (n = 2; n <= NUM - 1; ++n)  //index from 2 to NUM-1
        fib[n] = fib[n-1] + fib[n-2];  

    cout << "Fibonacci sequence:" << endl;
    for (n = 0; n < NUM; ++n)       //index from 0 to NUM-1
        cout << fib[n] << (n % 5 != 4 ? '\t' : '\n'); //print array items

    return 0;
}