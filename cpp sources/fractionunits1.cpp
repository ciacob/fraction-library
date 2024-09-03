#include <iostream>
#include <string.h>
#include "Fract.h"
#include <string>
using namespace std;

class FractionUnits : public Fraction {
public:
    string units;

    FractionUnits() {set(0, 1);}
    FractionUnits(int n, int d) {set(n, d);}
    FractionUnits(int n) {set(n, 1);}
    FractionUnits(const Fraction &src)
        {set(src.get_num(), src.get_den());}
    FractionUnits(const FractionUnits &src)
        {set(src.get_num(), src.get_den()); units = src.units;}

    // OVERRIDDEN FUNCTIONS

    FractionUnits add(const FractionUnits &other);
    FractionUnits operator+(const FractionUnits &other)
        {return add(other);}
    int operator==(const FractionUnits &other);

    friend ostream &operator<<(ostream &os, FractionUnits &fr);
};

int main() {
    FractionUnits f1(1, 2), f2(4, 3);
    f1.units = "feet";
    f2.units = "feet";
    FractionUnits f3 = f1 + f2;
    cout << "The length of the item is " << f3 << endl;
    return 0;
}

// FRACTIONUNIT FUNCTIONS
//--------------------------------------------

FractionUnits FractionUnits::add(const FractionUnits &other) {
    FractionUnits fr = Fraction::add(other);
    if (units == other.units)
        fr.units = units;
    return fr;
}

int FractionUnits::operator==(const FractionUnits &other) {
    return Fraction::operator==(other) && units == other.units;
}

ostream &operator<<(ostream &os, FractionUnits &fr) {
    os << fr.get_num() << "/" << fr.get_den();
    if (fr.units.size() > 0)
        os << " " << fr.units;
    return os;
}

