#include <iostream>
#include <chrono>

using namespace std;
using namespace std::chrono;

extern "C" int DoRun(float*, float*, int);

int main() {
    float arr[64] = { 1.00000f, 2.00000f, 3.00000f, 4.00000f };
    float mul[64] = { 1.00002f, 1.00002f, 1.00001f, 1.00001f };
    const int million = 1000000;

    steady_clock::time_point t1, t2;
    duration<double, milli> span;


    t1 = steady_clock::now();
    for (int i = 1; i < million; i++) {
        for (int j = 0; j < 4; j++) { arr[j] *= mul[j]; }
    }
    t2 = steady_clock::now();
    span = t2 - t1;
    cout << "\n\tC++ : " << span.count() << " ms" <<  endl;

    t1 = steady_clock::now();
    DoRun(arr, mul, million);
    t2 = steady_clock::now();
    span = t2 - t1;
    cout << "\n\tASM : " << span.count() << " ms" << endl;
    cout << "\n\t";
    return 0;
}