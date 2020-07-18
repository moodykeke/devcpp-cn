// 查找完全平方数 (本程序有错误，供调试)
// 程序运行时如果出现无限循环，请按 Ctrl + Break 中止。

#include <iostream>
using namespace std;

int main () {
    int m, n;
    for (n = 1; n <= 200; ++n)
        for (m = 1; m * m <= n; ++m)
            if (n = m * m)
                cout << n << "  "

    cout << endl;
    return 0;
}

