package ro.ciacob.math {
	public interface IFraction {
		
		/**
		 * Adds another fraction to this one.
		 * @param	other
		 * 			The fraction to add.
		 * 
		 * @return
		 * 			The addition result, as a new fraction.
		 */
		function add (other:IFraction):IFraction;
		
		/**
		 * Convenience method to determine what percentage "is" this fraction of another one.
		 * Shorthand for "getFractionOf (other).floatValue";
		 *  
		 * @param	other
		 * 			Another fraction to find out what percentage the current fraction represents of.
		 * 
		 * @return	A decimal value, such 0.5.
		 */
		function getPercentageOf (other:IFraction):Number;
		
		/**
		 * Alias of "divide (otherFraction)".
		 *  
		 * @param	other
		 * 			Another fraction to find out what fraction the current fraction represents of.
		 * 
		 * @return	A fraction, such 1/2.
		 */
		function getFractionOf (other : IFraction) : IFraction;
		
		/**
		 * @return The current denominator.
		 */
		function get denominator():int;
		
		/**
		 * Divides this fraction by another. This is a convenience method.
		 * 
		 * @param	other
		 * 			The fraction to divide by.
		 *
		 * @see getFractionOf()
		 * 
		 * @return
		 */
		function divide (other : IFraction) : IFraction;
		
		/**
		 * Checks if this fraction is equal to another.
		 * 
		 * @param	other
		 *			The fraction to test.
		 * 
		 * @return	The equality test result.
		 */
		function equals(other:IFraction):Boolean;
		
		/**
		 * @return	The (aproximated) floating point value.
		 */
		function get floatValue():Number;
		
		/**
		 * Checks if this fraction is greater than another.
		 * 
		 * @param	other
		 * 			The fraction to test.
		 * 
		 * @return	The test result.
		 */
		function greaterThan (other:IFraction) : Boolean;
		
		/**
		 * Checks if this fraction is smaller than another.
		 * 
		 * @param	other
		 * 			The fraction to test.
		 * 
		 * @return	The test result.
		 */
		function lessThan (other:IFraction) : Boolean;
		
		/**
		 * Multiplies this fraction by another.
		 * 
		 * @param	other
		 * 			The fraction to multiply by.
		 * 
		 * @return	The multiplication result.
		 */
		function multiply (other:IFraction):IFraction;
		
		/**
		 * @return	The current numerator of the function
		 */
		function get numerator():int;
		
		/**
		 * @return	The numerator with the whole-number portion removed.
		 */
		function get properNumerator():int;
		
		/**
		 * @return	The reciprocal (inverse) of the fraction, where the numerator and denominator switch place.
		 */
		function get reciprocal() : IFraction;
		
		/**
		 * Changes the fraction's compound value. You may specify a whole-number portion alogn with proper numerator and
		 * denominator. A proper numerator is a numerator that does not contain the whole-number portion. For example,
		 * to set the value 1 1/4 (read one whole and one fourth) you will use: setProperValue (1, 1, 4).
		 *
		 * This is equivalent to calling setValue (5, 4);
		 *
		 * @param	Whole
		 * 			The new whole-number portion
		 * 
		 * @param	ProperNumerator
		 * 			The new proper numerator, that is, a numerator that does not contain the whole-number portion.
		 * 
		 * @param	Denominator
		 * 			The new denominator.
		 */
		function setProperValue(Whole:int, ProperNumerator:int, Denominator:int):void;
		
		/**
		 * Changes the fraction's compound value.
		 * 
		 * @param	Numerator
		 * 			The new numerator.
		 * 
		 * @param	Denominator
		 * 			The new denominator.
		 */
		function setValue(Numerator:int, Denominator:int):void;
		
		/**
		 * Subtracts another fraction from this one.
		 * 
		 * @param	other
		 * 			The fraction to subtract.
		 * 
		 * @return	The subtraction result, as a new fraction.
		 */
		function subtract(other:IFraction):IFraction;
		
		/**
		 * Similar to `subtract` but switches fractions when `other` is greater than this 
		 * one.
		 * 
		 * @param	other
		 * 			The fraction to subtract.
		 * 
		 * @return	The subtraction result, as a new fraction.
		 */
		function subtractAbs (other : IFraction) : IFraction;
		
		/**
		 * @override
		 * @see Object.toString()
		 */
		function toString():String;
		
		/**
		 * @return	The whole part of the fraction, i.e. 5/4 is 1 whole and 1/4.
		 */
		function get whole():int;
	}
}