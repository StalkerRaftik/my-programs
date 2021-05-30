#include <iostream>
#include <vector>
#include <random>
#include <time.h>
#include <algorithm>
#include <stdlib.h>     /* abs */

using namespace std;

bool sortc(float a, float b) {
	return abs(a) > abs(b);
}

int main() {
	vector<float> a;

	float firstnum = 4.0 / 7.0;
	float secondsnum = -49.0 / 64.0;
	float mult = firstnum * secondsnum;

	a.push_back(4.0 / 7.0);
	a.push_back(-49.0 / 64.0);

	srand(time(0));

	for (int i = 0; i < 10000000; i++) {
		float n1 = a[rand() % a.size()];
		float n2 = a[rand() % a.size()];
		n1 = n1 * n2;
		a.push_back(n1);
	}

	sort(a.begin(), a.end(), sortc);

}