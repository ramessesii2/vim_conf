#include <vector>
#include <string>
#include <iostream>
#include <algorithm>
#include <sstream>
#include <queue>
#include <array>
#include <deque>
#include <bitset>
#include <iterator>
#include <list>
#include <stack>
#include <map>
#include <set>
#include <functional>
#include <numeric>
#include <utility>
#include <limits>
#include <time.h>
#include <math.h>
#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <assert.h>
#include <random>
#include <cassert>
#include <chrono>
#include <cmath>
/* bool compare(int a, int b){ */
/*     return a>b; */
/* } */

/* bool sortbysec(const pair<int,int> &a, */ 
/*               const pair<int,int> &b) */ 
/* { */ 
/*     return (a.second < b.second); */ 
/* } */ 
  


/* int binarySearch (const int A[], int length, int val) { */

/*     int low, mid, high; */
/*     low = 0;            // set initial value for low */
/*     high = length - 1;  // set initial value for high */

/*     while (low <= high) { */
/*         mid = low + (high - low)/2; // update mid */
        
/*         if (A [mid] > val) { // search left subarray for val */
/*             high = mid - 1;  // update high */
/*         } */
/*         else if (A [mid] < val) { // search right subarray for val */
/*             low = mid + 1;        // update low */
/*         } */
/*         else {           // val = A[mid] */
/*             return mid;  // return index of val in A */
/*         } */
/*     } */

/*     return (-1); // val not found in A */
/* } */
/* void radix_sort(vector<pair<pair<int, int>, int >> &a){ */
/*     int n = sz(a); */
/*     { */
/*         vector<pair<pair< int, int> , int>> a_new(n); */
/*         vi bucket(n, 0); */
/*         for(auto x: a){ */
/*             bucket[x.ff.ss]++; */
/*         } */
/*         vi pos(n); */
/*         pos[0] = 0; */
/*         loop(i, 1, n){ */
/*             pos[i] = pos[i-1] + bucket[i-1]; */
/*         } */
/*         for(auto x: a){ */
/*             int i = x.ff.ss; */
/*             a_new[pos[i]] = x; */
/*             pos[i]++; */
/*         } */
/*         a = a_new; */
/*     } */
/*     { */
/*         vector<pair<pair< int, int> , int>> a_new(n); */
/*         vi bucket(n, 0); */
/*         for(auto x: a){ */
/*             bucket[x.ff.ff]++; */
/*         } */
/*         vi pos(n); */
/*         pos[0] = 0; */
/*         loop(i, 1, n){ */
/*             pos[i] = pos[i-1] + bucket[i-1]; */
/*         } */
/*         for(auto x: a){ */
/*             int i = x.ff.ff; */
/*             a_new[pos[i]] = x; */
/*             pos[i]++; */
/*         } */
/*         a = a_new; */
/*     } */
/* } */

