import 'package:dart_numerics/dart_numerics.dart' as numerics;

class FractionConstants {
  // -------------------------------------------------------------------------
  // Utils constants
  // -------------------------------------------------------------------------
  static const int ONE = 1;
	static const int ZERO = 0;

  // -------------------------------------------------------------------------
  // Error texts
  // -------------------------------------------------------------------------
  static const String ERR_NULL_NUMERATOR = "Numerator is null.";
  static const String ERR_NULL_DENOMINATOR = "Denominator is null.";
  static const String ERR_NULL_FRACTION = "Fraction is null.";
  static const String ERR_NULL_NUMBER = "Number is null.";
  static const String ERR_DIVITE_BY_ZERO = "Divide by zero.";
  static const String ERR_NUMBER_NAN = "Number is NaN.";
  static const String ERR_NUMBER_INFINITE = "Number is infinite.";
  static const String ERR_NULL_PARAMETER = "Parameter is null.";
  static const String ERR_PARAMETER_TYPE_IS_NOT_SUPPERTED = "Parameter type is not supported.";


  static int getIntDigits() {
    return (numerics.int64MaxValue.toString().length - 1);
  }
}