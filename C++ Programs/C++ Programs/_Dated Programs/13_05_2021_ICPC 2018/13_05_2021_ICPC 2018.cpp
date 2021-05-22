#include <iostream>
#include <vector>
#include <string>
#include <math.h>
using namespace std;

int main()
{
	//float t, p; // Время до 
	//cin >> t >> p;

	//
	//float batterySpend = (100 - p);
	//float lowspend = 0;
	//if (batterySpend > 80) {
	//	lowspend = batterySpend - 80;
	//	batterySpend = 80;
	//}
	//float bpm = (batterySpend + 2*lowspend)/t; // Расход батареи в минуту

	//
	//float res = 0;
	//float res2 = 0;
	//float lowtime = 20;

	//if (p >= 20) {
	//	p = p - 20;
	//	res = p / bpm;
	//}
	//else {
	//	lowtime = p;
	//}
	//res2 = lowtime / (bpm / 2);


	//res = res + res2;
	//cout << res;


	
	string str;
	cin >> str;
	int len;
	cin >> len;
	
	string endstr = "";
	float timesraw = (float)len / str.length();
	double q = 0;

	int times = (int)timesraw;
	if (modf(timesraw, &q) > 0) {
		times++;
	}
	for (int i = 0; i < times; i++) {
		endstr = endstr + str;
	}
	

	string in;
	for (int i = 0; i < len; i++) {
		in = in + endstr[i];
	}
	vector<vector<string>> ans(len, vector<string>());
	

	for (int i = 0; i < in.length(); i++) {
		for (int j = 0; j < in.length(); j++) {
			if (i + j >= in.length()) break;
			string s;
			for (int k = 0; k <= i; k++) {
				s = s + in[k+j];
			}
			bool fnd = false;
			for (int k = 0; k < ans[i].size(); k++) {
				if (ans[i][k] == s) {
					fnd = true;
					break;
				}
			}
			if (!fnd) {
				ans[i].push_back(s);
			}
		}
	}

	int out = 0;
	for (int i = 0; i < ans.size(); i++) {
		out = out + ans[i].size();
		/*for (int j = 0; j < ans[i].size(); j++) {
			cout << ans[i][j] << endl;
		}*/
	}
	cout << out;
}
