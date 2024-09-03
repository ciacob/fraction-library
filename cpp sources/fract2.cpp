#include <stdlib.h>
#include <iostream>
using namespace std;

class Fraction {
private:
    int num, den;      // Numerator and denominator.
public:
    void set(int n, int d) {num = n; den = d; normalize();}
    int get_num()  {return num;}
    int get_den()  {return den;}
private:
    void normalize();   // Put fraction into standard form.
    int gcf(int a, int b);   // Greatest Common Factor.
    int lcm(int a, int b);   // Lowest Common Denominator.
};

int main() {
    int a, b;
    char str[81];
    Fraction fract;
    while (1) {
        cout << "Enter numerator: ";
        cin >> a;
        cout << "Enter denominator: ";
        cin >> b;
        fract.set(a, b);
        cout << "Numerator is   " << fract.get_num() << endl;
        cout << "Denominator is " << fract.get_den() << endl;
        cout << "Do again? (Y or N) ";
        cin >> str;
        if (!(str[0] == 'Y' || str[0] == 'y'))
             break;
    }
}

// ---------------------------------------------------
// FRACTION CLASS FUNCTIONS

// Normalize: put fraction into a standard form, unique
//  for each mathematically different value.
//
void Fraction::normalize(){

    // Handle cases involving 0

    if (den == 0 || num == 0) {
        num = 0;
        den = 1;
    }

    // Put neg. sign in numerator only.

    if (den < 0) {
        num *= -1;
        den *= -1;
    }

    // Factor out GCF from numerator and denominator.

    int n = gcf(num, den);
    num = num / n;
    den = den / n;
}

// Greatest Common Factor
//
int Fraction::gcf(int a, int b) {
    if (a % b == 0)
        return abs(b);
    else
        return gcf(b, a % b);
}

// Lowest Common Multiple
//
int Fraction::lcm(int a, int b){
    return (a / gcf(a, b)) * b;
}
