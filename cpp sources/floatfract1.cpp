#include <iostream>
#include "Fract.h"
using namespace std;

class FloatFraction : public Fraction {
public:
    double get_float() {
     return static_cast<double>(get_num())/get_den();}
};

int main() {
    FloatFraction fract1;

    fract1.set(1, 2);
    cout << "Value of 1/2 is " << fract1.get_float() << endl;
    fract1.set(3, 5);
    cout << "Value of 3/5 is " << fract1.get_float() << endl;
    return 0;
}