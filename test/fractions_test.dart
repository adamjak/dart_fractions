import 'package:flutter_test/flutter_test.dart';

import 'package:fractions/fractions.dart';

void main() {
  test('fraction + test', () {
    Fraction f1 = Fraction.createFractionFromNumeratorDenominator(1, 2);
    Fraction f2 = Fraction.createFractionFromNumeratorDenominator(3, 4);
    expect((f1 + f2), Fraction.createFractionFromNumeratorDenominator(5, 4));
  });

  test('fraction - test', () {
    Fraction f1 = Fraction.createFractionFromNumeratorDenominator(1, 2);
    Fraction f2 = Fraction.createFractionFromNumeratorDenominator(3, 4);
    expect((f1 - f2), Fraction.createFractionFromNumeratorDenominator(-1, 4));
  });

  test('fraction * test', () {
    Fraction f1 = Fraction.createFractionFromNumeratorDenominator(1, 2);
    Fraction f2 = Fraction.createFractionFromNumeratorDenominator(3, 4);
    expect((f1 * f2), Fraction.createFractionFromNumeratorDenominator(3, 8));
  });

  test('fraction / test', () {
    Fraction f1 = Fraction.createFractionFromNumeratorDenominator(1, 2);
    Fraction f2 = Fraction.createFractionFromNumeratorDenominator(3, 4);
    expect((f1 / f2), Fraction.createFractionFromNumeratorDenominator(2, 3));
  });
}
