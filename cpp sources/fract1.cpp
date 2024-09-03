#include <stdlib.h>

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
    return (a / gfc(a, b)) * b;
}
