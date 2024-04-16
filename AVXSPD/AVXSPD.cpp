#include <iostream>
#include <chrono>
#include <intrin.h>

using namespace std ;
using namespace std::chrono ;

int main( ) {
  float arr[8] = { 1.0f, 2.0f, 3.0f, 4.0f, 5.0f, 6.0f, 7.0f, 8.0f };
  float mul[8] = { 1.000001f, 1.000002f, 
			1.000003f, 1.000004f,
				1.000005f, 1.000006f, 
				1.000007f, 1.000008f } ;
  const int million = 1000000 ;
  steady_clock::time_point t1, t2 ;
  duration<double, milli> span ;

  __m256 v1 = _mm256_load_ps( arr ) ;
  __m256 v2 = _mm256_load_ps( mul ) ;

  cout << "\n\tEight Million Operations:" << endl;
  t1 = steady_clock::now( ) ;
  for ( int i = 1 ; i < million ; i++)
  {
      for ( int j = 0 ; j < 8 ; j++) { arr[ j ] *= mul[ j ] ; }
  }
  t2 = steady_clock::now( ) ;
  span = t2 - t1 ;
  cout << "\n\tC++ : " << span.count( ) << " ms" << endl ;

  t1 = steady_clock::now( ) ;
  for ( int i = 1; i < million; i++)
  {
    v1 =_mm256_mul_ps( v1, v2 ) ;
  }
  t2 = steady_clock::now( ) ;
  span = t2 - t1;
  cout << "\n\tAVX : " << span.count( ) << " ms" << endl ;
  cout << "\n\t" ;
  return 0 ;
}