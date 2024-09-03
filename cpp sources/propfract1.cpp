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

class ProperFraction : public FloatFraction {
public:
    ProperFraction() {set(0, 1);}
    ProperFraction(int n, int d) {set(n, d);}
    ProperFraction(int n) {set(n, 1);}
    ProperFraction(const ProperFraction &src)
        {set(src.Fraction::get_num(), src.get_den());}
    ProperFraction(const FloatFraction &src)
        {set(src.Fraction::get_num(), src.get_den());}
    ProperFraction(const Fraction &src)
        {set(src.Fraction::get_num(), src.get_den());}
    

    void pr_proper(ostream &os);
    int get_whole();
    int get_num();                 // OVERRIDDEN FUNCTION!
};

int main() {
    ProperFraction f1(1, 2), f2(5, 6), f3;

    f3 = f1 + f2;
    cout << "Value of f3 is ";
    f3.pr_proper(cout);
    cout << endl;
    cout << "Float value of f3 is " << f3.get_float() << endl;
    return 0;
}

// PROPERFRACTION FUNCTIONS
//-----------------------------------------------------

// Print Proper Fraction function:
// Using the output stream (os) specified, print an object
//  in the form "1 1/2"
//
void ProperFraction::pr_proper(ostream &os) {
    if (get_whole() != 0)
        os << get_whole() << " ";
    os << get_num() << "/" << get_den();
}

// Get Whole function
// Return whole-number portion by using integer division.
//
int ProperFraction::get_whole() {
    int n = Fraction::get_num();
    return n / get_den();
}

// Get Numerator function (OVERRIDDEN)
// Return numerator for a proper fraction, by using
//  modulus (remainder) division.
//
int ProperFraction::get_num() {
    int n = Fraction::get_num();
    return n % get_den();
}
