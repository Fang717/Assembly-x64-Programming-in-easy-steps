#include <iostream>
#include <chrono>
#include <xmmintrin.h>

using namespace std;
using namespace std::chrono;

int main()
{
    __m128 v1 = { 1.00000f, 2.00000f, 3.00000f, 4.00000f };
    __m128 v2 = { 1.00002f, 1.00002f, 1.00001f, 1.00001f };
    
    const int million = 1000000;

    steady_clock::time_point t1, t2;
    duration<double, milli> span;
    
    t1 = steady_clock::now();
    for (int i = 1; i < million; i++)
    {
        v1=_mm_mul_ps(v1, v2);
    }
    t2 = steady_clock::now();
    span = t2 - t1;
    cout << "\n\tIntrinsic Ticks: " << span.count() ; 
    cout << endl << "\n\t";

    return 0;
}

