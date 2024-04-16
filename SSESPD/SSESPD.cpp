#include <iostream>
#include <chrono>
#include <xmmintrin.h>

using namespace std;
using namespace std::chrono;
int main() {
    float arr[4] = { 1.0f, 2.0f, 3.0f, 4.0f };
    float mul[4] = { 1.000001f, 1.000002f,
              1.000003f, 1.000004f };
    const int million = 1000000;
    steady_clock::time_point t1, t2;
    duration<double, milli> span;

    __m128 v1 = _mm_load_ps(arr);
    __m128 v2 = _mm_load_ps(mul);

    cout << "\n\tFour Million Operations:" << endl;
    t1 = steady_clock::now();
    for (int i = 1; i < million; i++)
    {
        for (int j = 0; j < 4; j++) { arr[j] *= mul[j]; }
    }
    t2 = steady_clock::now();
    span = t2 - t1;
    cout << "\n\tC++ : " << span.count() << " ms" << endl;

    t1 = steady_clock::now();
    for (int i = 1; i < million; i++)
    {
        v1 = _mm_mul_ps(v1, v2);
    }
    t2 = steady_clock::now();
    span = t2 - t1;
    cout << "\n\tSSE : " << span.count() << " ms" << endl;
    cout << "\n\t";
    return 0;
}