import 'package:fractions/fractions.dart' as frac;

main() {
  frac.Fraction f1 = frac.Fraction.createFractionFromNumeratorDenominator(1, 3);
  print(f1 + f1);
}