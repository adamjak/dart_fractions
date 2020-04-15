library fractions;

import 'dart:core';
import 'dart:math' as math;

import 'package:fractions/fraction_constants.dart';

class Fraction implements Comparable<Fraction> {
  final int _numerator;
  final int _denominator;

  Fraction._(this._numerator, this._denominator);

  int get numerator => _numerator;

  int get denominator => _denominator;

  static Fraction createFractionFromNumeratorDenominator(num numerator, num denominator) {

    Fraction num, den;

    if (numerator.runtimeType == int) {
      num = Fraction._createFraction(numerator.toInt(), FractionConstants.ONE);
    } else {
      num = Fraction._createFractionFromDouble(numerator.toDouble());
    }

    if (denominator.runtimeType == int) {
      den = Fraction._createFraction(denominator.toInt(), FractionConstants.ONE);
    } else {
      den = Fraction._createFractionFromDouble(denominator.toDouble());
    }

    return Fraction._createFraction(num.numerator * den.denominator, num.denominator * den.numerator);
  }

  static Fraction createFractionFromNumber (num number) {
    return Fraction.createFractionFromNumeratorDenominator(number, 1);
  }

  static Fraction _createFraction (int numerator, int denominator) {
    if(numerator == null) new ArgumentError(FractionConstants.ERR_NULL_NUMERATOR);
    if(denominator == null) new ArgumentError(FractionConstants.ERR_NULL_DENOMINATOR);
    if(denominator == FractionConstants.ZERO) new ArgumentError(FractionConstants.ERR_DIVITE_BY_ZERO);

    if(Fraction._signum(denominator) < FractionConstants.ZERO)
    {
      numerator = Fraction._negation(numerator);
      denominator = Fraction._negation(denominator);
    }

    if (numerator == FractionConstants.ZERO)
    {
      return new Fraction._(numerator, FractionConstants.ONE);
    }

    int gcd = Fraction._greatestCommonDivisor(numerator.abs(), denominator.abs());

    return new Fraction._((numerator / gcd).toInt(), (denominator / gcd).toInt());
  }

  static Fraction _createFractionFromDouble (double d) {
    if(d == null) new ArgumentError(FractionConstants.ERR_NULL_NUMBER);
    if(d.isInfinite) throw new ArgumentError(FractionConstants.ERR_NUMBER_INFINITE);
    if(d.isNaN) throw new ArgumentError(FractionConstants.ERR_NUMBER_NAN);

    if(d == 0) {
      return new Fraction._(FractionConstants.ZERO, FractionConstants.ONE);
    }

    bool negative = false;

    if (d < 0) {
      negative = true;
    }

    d = d.abs();

    int intPart = d.toInt();
    d = d - intPart;

    int numerator = (d * math.pow(10, FractionConstants.getIntDigits())).toInt();
    int denominator = math.pow(10, FractionConstants.getIntDigits()).toInt();

    if (negative) {
      numerator = numerator * -1;
    }

    Fraction f = Fraction.createFractionFromNumeratorDenominator(numerator,denominator);
    f = f + intPart;

    return f;
  }

  Fraction operator +(var other) {
    if (other == null) new ArgumentError(FractionConstants.ERR_NULL_PARAMETER);
    if (other.runtimeType == Fraction) {
      return this._add(other);
    }
    if (other.runtimeType == num) {
      return this._add(Fraction.createFractionFromNumber(other));
    }

    new ArgumentError(FractionConstants.ERR_PARAMETER_TYPE_IS_NOT_SUPPERTED);
  }

  Fraction operator -(var other) {
    if (other == null) new ArgumentError(FractionConstants.ERR_NULL_PARAMETER);
    if (other.runtimeType == Fraction) {
      return this._subtract(other);
    }
    if (other.runtimeType == num) {
      return this._subtract(Fraction.createFractionFromNumber(other));
    }

    new ArgumentError(FractionConstants.ERR_PARAMETER_TYPE_IS_NOT_SUPPERTED);
  }

  Fraction operator *(var other) {
    if (other == null) new ArgumentError(FractionConstants.ERR_NULL_PARAMETER);
    if (other.runtimeType == Fraction) {
      return this._multiply(other);
    }
    if (other.runtimeType == num) {
      return this._multiply(Fraction.createFractionFromNumber(other));
    }

    new ArgumentError(FractionConstants.ERR_PARAMETER_TYPE_IS_NOT_SUPPERTED);
  }

  Fraction operator /(var other) {
    if (other == null) new ArgumentError(FractionConstants.ERR_NULL_PARAMETER);
    if (other.runtimeType == Fraction) {
      return this._divide(other);
    }
    if (other.runtimeType == num) {
      if (other == 0) new ArgumentError(FractionConstants.ERR_DIVITE_BY_ZERO);
      return this._divide(Fraction.createFractionFromNumber(other));
    }

    new ArgumentError(FractionConstants.ERR_PARAMETER_TYPE_IS_NOT_SUPPERTED);
  }

  Fraction max (Fraction other) {
    if (other == null) new ArgumentError(FractionConstants.ERR_NULL_FRACTION);
    return this.compareTo(other) >= 0 ? this : other;
  }

  Fraction min (Fraction other) {
    if (other == null) new ArgumentError(FractionConstants.ERR_NULL_FRACTION);
    return this.compareTo(other) < 0 ? this : other;
  }

  Fraction pow (double exponent) {
    if (exponent == null) new ArgumentError("Exponent can't be null.");

    if(exponent == 0) {
			return Fraction.createFractionFromNumber(1);
		} else if (exponent == 1) {
			return Fraction.createFractionFromNumeratorDenominator(this.numerator,this.denominator);
		} else if (exponent < 0) {
			return Fraction.createFractionFromNumeratorDenominator(
          math.pow(this.denominator, -exponent),
          math.pow(this.numerator, -exponent)
      );
		} else{
			return Fraction.createFractionFromNumeratorDenominator(
          math.pow(this.numerator, exponent),
          math.pow(this.denominator, exponent)
      );
		}
  }

  Fraction reciprocal() {
		if (this.numerator == 0) throw new Error();

		return Fraction.createFractionFromNumeratorDenominator(this.denominator, this.numerator);
	}

  double inPercentage() {
    return this.toDouble() * 100;
  }

  double log()
  {
    return math.log(this.numerator) - math.log(this.denominator);
  }

  double toDouble () {
    return this.numerator / this.denominator;
  }

  int toInt() {
    return this.toDouble().round();
  }

  Fraction clone () {
    return Fraction.createFractionFromNumeratorDenominator(this.numerator.toInt(), this.denominator.toInt());
  }

  Fraction _add (Fraction other) {
    return Fraction._createFraction(
        this.numerator * other.denominator + other.numerator * this.denominator,
        this.denominator * other.denominator
    );
  }

  Fraction _multiply (Fraction other) {
    return Fraction._createFraction(other.numerator * this.numerator, other.denominator * this.denominator);
  }

  Fraction _subtract (Fraction other) {
    return Fraction._createFraction(this.numerator * other.denominator - other.numerator * this.denominator, this.denominator * other.denominator);
  }

  Fraction _divide (Fraction other) {
    return Fraction._createFraction(this.numerator * other.denominator, this.denominator * other.numerator);
  }


  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is Fraction &&
              runtimeType == other.runtimeType &&
              _numerator == other._numerator &&
              _denominator == other._denominator;

  @override
  int get hashCode =>   _numerator.hashCode ^ _denominator.hashCode;

  @override
  String toString () {
    return this.numerator.toString() + "/" + this.denominator.toString();
  }


  @override
  int compareTo(Fraction other) {
    if(other == null) new NullThrownError();

    if(Fraction._signum(this.numerator) != Fraction._signum(other.numerator)) {
      return Fraction._signum(this.numerator) - Fraction._signum(other.numerator);
    }

    if(this.denominator == other.denominator) {
      return this.numerator.compareTo(other.numerator);
    }



    return (this.numerator * other.denominator).compareTo(this.denominator * other.numerator);
  }

  static int _greatestCommonDivisor(int a, int b) {
    if (a < 1 || b < 1)  new ArgumentError("One of the specified numbers is less than 1.");

    while (b != 0) {
      int tmp = a;
      a = b;
      b = tmp % b;
    }

    return a;
  }

  static int _signum(int a) {
    if (a > 0) {
      return 1;
    }
    else if (a < 0) {
      return -1;
    } else {
      return 0;
    }
  }

  static int _negation(int a) {
    return a * -1;
  }
}
