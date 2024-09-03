#include <iostream>
#include "fract.h"
using namespace std;

class FloatFraction : public Fraction {
public:
    double float_val;

    FloatFraction() {set(0, 1);}
    FloatFraction(int n, int d) {set(n, d);}
    FloatFraction(int n) {set(n, 1);}
    FloatFraction(const FloatFraction &src)
        {set(src.get_num(), src.get_den());}
    FloatFraction(const Fraction &src)
        {set(src.get_num(), src.get_den());}

    void normalize();   // OVERRIDDEN
};

void FloatFraction::normalize() {
    Fraction::normalize();
    float_val = static_cast<double>(get_num()) / get_den();
}

int main() {
    FloatFraction fract1(1, 4), fract2(1, 2);

    FloatFraction fract3 = fract1 + fract2;
    cout << "1/4 + 1/2 = " << fract3 << endl;
    cout << "Floating pt value is = " << fract3.float_val << endl;
}
