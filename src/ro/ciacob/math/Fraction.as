package ro.ciacob.math {
	import ro.ciacob.utils.NumberUtil;

	/**
	 * Holds rational numbers in numerator/denominator form instead of floating point form.
	 * Provides basic math operations.
	 */
	public class Fraction {
		
		public static function get WHOLE() : Fraction {
			return new Fraction(1,1);
		}
		
		public static function get ZERO() : Fraction {
			return new Fraction(0,1);
		}

		/**
		 * Convenience comparison method to be used when sorting arrays and similar
		 * operations.
		 * 
		 * @param other		The fraction to compare with
		 * @return 			The test result, which can be: 1, if current fraction is
		 * 					greater than the other; -1, if current fraction is less
		 * 					than the other; and 0 if fractions are equal.
		 */
		public static function compare (a : Fraction, b : Fraction) : int {
			return a.greaterThan(b)? 1 : a.lessThan(b)? -1 : 0;
		}

		public static function fromString(value:String):Fraction {
			var segments:Array = value.split('/');
			if (segments.length == 2) {
				var numVal:String = segments[0];
				var numLong:Number = parseInt(numVal);
				if (!isNaN(numLong)) {
					var numUint:uint = uint(numLong);
					if (numUint == numLong) {
						var denomVal:String = segments[1];
						var denomLong:Number = parseInt(denomVal);
						if (!isNaN(denomLong)) {
							var denomUint:uint = uint(denomLong);
							if (denomUint == denomLong) {
								var fraction:Fraction = new Fraction;
								fraction.setValue(numUint, denomUint);
								return fraction;
							}
						}
					}
				}
			}
			throw(new ArgumentError('Fraction::fromString() failed to import a fraction value from `' + value + '`. The only accepted format is (regexp): `\d+\/\d+`, e.g.: `1/4`.'));
			return null;
		}

		/**
		 * You may construct a Fraction instance as follows:
		 * - new Fraction;
		 * - new Fraction (other : Fraction); // copies numerator and denominator values from the other fraction
		 * - new Fraction (numerator : int); // assumes 1 as the denominator
		 * - new Fraction (numerator : int, denominator : int);
		 * - new Fraction (whole : int, numerator : int, denominator : int);
		 */
		public function Fraction(... params) {
			var tmpFract:Fraction;
			var tmpNum:int;
			var haveArgError:Boolean;
			if (params.length == 0) {
				setValue(0, 1);
			} else if (params.length == 1) {
				if (params[0] is Fraction) {
					tmpFract = (params[0] as Fraction);
					setValue(tmpFract.numerator, tmpFract.denominator);
				} else if (params[0] is int) {
					setValue(params[0], 1);
				} else {
					haveArgError = true;
				}
			} else if (params.length == 2) {
				if (params[0] is int && params[1] is int) {
					setValue(params[0], params[1])
				} else {
					haveArgError = true;
				}
			} else if (params.length == 3) {
				if (params[0] is int && params[1] is int && params[2] is int) {
					tmpNum = params[0] * params[2] + params[1];
					setValue(tmpNum, params[2]);
				} else {
					haveArgError = true;
				}
			} else {
				haveArgError = true;
			}
			if (haveArgError) {
				var err:ArgumentError = new ArgumentError('Cannot create a new Fraction with provided argument(s). Please refer to documentation.');
				throw(err);
			}
		}

		private var _denominator:int;

		private var _numerator:int;

		/**
		 * Adds another fraction to this one.
		 * @param other		The fraction to add.
		 * @return 			The addition result, as a new fraction.
		 */
		public function add (other:Fraction):Fraction {
			var lcd:int = NumberUtil.lcm(_denominator, other.denominator);
			var quot1:int = lcd / _denominator;
			var quot2:int = lcd / other.denominator;
			var fract:Fraction = new Fraction;
			fract.setValue(_numerator * quot1 + other.numerator * quot2, lcd);
			return fract;
		}
		
		/**
		 * Convenience method to determine what percentage "is" this fraction from another one.
		 * Shorthand for "getFractionOf (other).floatValue";
		 *  
		 * @param	other
		 * 			Another fraction to find out what percentage the current fraction represents of.
		 * 
		 * @return	A decimal value, such 0.5.
		 */
		public function getPercentageOf (other:Fraction):Number {
			return getFractionOf(other).floatValue;
		}
		
		/**
		 * Syntax sugar for "this.divide (other)".
		 *  
		 * @param	other
		 * 			Another fraction to find out what fraction the current fraction represents of.
		 * 
		 * @return	A Fraction object, such 1/2.
		 */
		public function getFractionOf (other : Fraction) : Fraction {
			return this.divide (other);
		}

		/**
		 * @return The current denominator.
		 */
		public function get denominator():int {
			return _denominator;
		}

		/**
		 * Divides this fraction by another. This is a convenience method.
		 * @param other		The fraction to divide by.
		 * @return
		 */
		public function divide(other:Fraction):Fraction {
			return multiply(other.reciprocal);
		}

		/**
		 * Checks if this fraction is equal to another.
		 * @param other		The fraction to test.
		 * @return			The equality test result.
		 */
		public function equals(other:Fraction):Boolean {
			return (_numerator == other.numerator && _denominator == other.denominator);
		}

		/**
		 * @return		The (aproximated) floating point value.
		 */
		public function get floatValue():Number {
			return _numerator / _denominator;
		}

		/**
		 * Checks if this fraction is greater than another.
		 * @param other		The fraction to test.
		 * @return			The test result.
		 */
		public function greaterThan(other:Fraction):Boolean {
			return (other.denominator * _numerator > _denominator * other.numerator);
		}

		/**
		 * Checks if this fraction is smaller than another.
		 * @param other		The fraction to test.
		 * @return			The test result.
		 */
		public function lessThan(other:Fraction):Boolean {
			return (other.denominator * _numerator < _denominator * other.numerator);
		}


		/**
		 * Multiplies this fraction by another.
		 * @param other		The fraction to multiply by.
		 * @return			The multiplication result.
		 */
		public function multiply(other:Fraction):Fraction {
			var fract:Fraction = new Fraction;
			fract.setValue(_numerator * other.numerator, _denominator * other.denominator);
			return fract;
		}

		/**
		 * @return		The current numerator of the function
		 */
		public function get numerator():int {
			return _numerator;
		}

		/**
		 * @return		The numerator with the whole-number portion removed.
		 */
		public function get properNumerator():int {
			return (_numerator % _denominator);
		}

		/**
		 * @return		The reciprocal (inverse) of the fraction, where the numerator and denominator switch place.
		 */
		public function get reciprocal():Fraction {
			return new Fraction(denominator, numerator);
		}

		/**
		 * Changes the fraction's compound value. You may specify a whole-number portion alogn with proper numerator and
		 * denominator. A proper numerator is a numerator that does not contain the whole-number portion. For example,
		 * to set the value 1 1/4 (read one whole and one fourth) you will use: setProperValue (1, 1, 4).
		 *
		 * This is equivalent to calling setValue (5, 4);
		 *
		 * @param w		The new whole-number portion
		 * @param pn	The new proper numerator, that is, a numerator that does not contain the whole-number portion.
		 * @param d		The new denominator.
		 */
		public function setProperValue(w:int, pn:int, d:int):void {
			var tmpNum:int = w * d + pn;
			setValue(tmpNum, d);
		}

		/**
		 * Changes the fraction's compound value.
		 * @param n		The new numerator.
		 * @param d		The new denominator.
		 */
		public function setValue(n:int, d:int):void {
			_numerator = n;
			_denominator = d;
			_normalize();
		}

		/**
		 * Subtracts another fraction from this one.
		 * 
		 * @param other		The fraction to subtract.
		 * @return 			The subtraction result, as a new fraction.
		 */
		public function subtract(other:Fraction):Fraction {
			var fract:Fraction = new Fraction;
			var lcd:int = NumberUtil.lcm(_denominator, other.denominator);
			var quot1:int = lcd / _denominator;
			var quot2:int = lcd / other.denominator;
			fract.setValue(_numerator * quot1 - other.numerator * quot2, lcd);
			return fract;
		}
		
		/**
		 * Similar to `subtract` but switches fractions when `other` is greater than this 
		 * one.
		 * 
		 * @param other		The fraction to subtract.
		 * @return 			The subtraction result, as a new fraction.
		 */
		public function subtractAbs (other : Fraction) : Fraction {
			if (other.greaterThan(this)) {
				return other.subtract(this);
			}
			return subtract(other);
		}

		/**
		 * @override
		 * @see Object.toString()
		 */
		public function toString():String {
			return (_numerator + '/' + _denominator);
		}

		/**
		 * @return		The whole part of the fraction, i.e. 5/4 is 1 whole and 1/4.
		 */
		public function get whole():int {
			return (_numerator - properNumerator) / _denominator;
		}

		/**
		 * @private
		 * Puts fraction into a standard form, unique for each mathematically different value.
		 */
		private function _normalize():void {
			// Handle cases involving 0
			if (_denominator == 0 || _numerator == 0) {
				_numerator = 0;
				_denominator = 1;
			}
			// Put negative sign in numerator only.
			if (denominator < 0) {
				_numerator *= -1;
				_denominator *= -1;
			}
			// Factor out GCF from numerator and denominator.
			var n:int = NumberUtil.gcf (_numerator, _denominator);
			_numerator = _numerator / n;
			_denominator = _denominator / n;
		}
	}
}
