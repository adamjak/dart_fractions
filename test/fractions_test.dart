import 'package:flutter_test/flutter_test.dart';

import 'package:fractions/fractions.dart';

void main() {

  test('fraction create test', () {
    Fraction f1 = Fraction.createFractionFromNumber(0.5);
    expect(f1, Fraction.createFractionFromNumeratorDenominator(1, 2));
  });

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

  test('fraction == test', () {
    Fraction f1 = Fraction.createFractionFromNumeratorDenominator(1, 2);
    Fraction f2 = Fraction.createFractionFromNumeratorDenominator(3, 4);
    expect((f1 == f2), false);
    expect((f1 != f2), true);
    expect((f1 == Fraction.createFractionFromNumeratorDenominator(1, 2)), true);
  });

  test('fraction max test', () {
    Fraction f1 = Fraction.createFractionFromNumeratorDenominator(1, 2);
    Fraction f2 = Fraction.createFractionFromNumeratorDenominator(3, 4);
    expect((f1.max(f2)), f2);
  });

  test('fraction min test', () {
    Fraction f1 = Fraction.createFractionFromNumeratorDenominator(1, 2);
    Fraction f2 = Fraction.createFractionFromNumeratorDenominator(3, 4);
    expect((f1.min(f2)), f1);
  });

  test('fraction reciprocal test', () {
    Fraction f1 = Fraction.createFractionFromNumeratorDenominator(4, 3);
    Fraction f2 = Fraction.createFractionFromNumeratorDenominator(3, 4);
    expect((f1.reciprocal()), f2);
  });

  test('fraction toDouble test', () {
    Fraction f1 = Fraction.createFractionFromNumeratorDenominator(1, 2);
    expect((f1.toDouble()), 0.5);
  });

  test('fraction toInt test', () {
    Fraction f1 = Fraction.createFractionFromNumeratorDenominator(22,7);
    expect((f1.toInt()), 3);
  });


}
