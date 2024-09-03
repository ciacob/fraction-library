#include <iostream>
#include "Fract.h"
using namespace std;

class FloatFraction : public Fraction {
public:
    FloatFraction() {set(0, 1);}
    FloatFraction(int n, int d) {set(n, d);}
    FloatFraction(int n) {set(n, 1);}
    FloatFraction(const FloatFraction &src)
        {set(src.get_num(), src.get_den());}
    FloatFraction(const Fraction &src)
        {set(src.get_num(), src.get_den());}

    double get_float() {
      return static_cast<double>(get_num())/get_den();}
};

int main() {
    FloatFraction f1(1, 2), f2(1, 3), f3;

    f3 = f1 + f2;
    cout << "Value of f3 is " << f3 << endl;
    cout << "Float value of f3 is " << f3.get_float() << endl;
    return 0;
}
