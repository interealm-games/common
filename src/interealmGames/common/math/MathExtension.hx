package interealmGames.common.math;

using interealmGames.common.math.MathExtension; //self reference

import Math in Parent;
import interealmGames.common.math.Rounding;

/**
 * Extends the standard Math library
 */
class MathExtension 
{
	/**
	 * Rounds to a certain number of decimal points using a rounding strategy
	 * @param value The value to round
	 * @param precision Number of decimal places to round to
	 * @param rounding The rounding strategy
	 * @return The rounded float
	 */
	static public function roundTo(
		cl:Class<Parent>, 
		value:Float, 
		precision:Int, 
		rounding:Rounding = Rounding.NearestAwayFromZero
	):Float {
		var factor = Math.pow(10, precision);
		value = value * factor;
		value = Math.roundBy(value, rounding);
		value = value / factor;
		return value;
	}

	/**
	 * Implements various rounding strategies
	 * @param value The value to round
	 * @param rounding The rounding strategy
	 * @return The rounded float
	 */
	static public function roundBy(cl:Class<Parent>, value:Float, rounding:Rounding): Float {
		return switch(rounding) {
			case Rounding.Ceil:
				Math.fceil(value);
			case Rounding.CeilAbsolute:
				value > 0 ? Math.fceil(value) : Math.ffloor(value);
			case Rounding.Floor:
				Math.ffloor(value);
			case Rounding.FloorAbsolute:
				value > 0 ? Math.ffloor(value) : Math.fceil(value);
			case Rounding.NearestAwayFromZero:
				value > 0 ? Math.fround(value) : -1 * Math.fround(value * -1);
			case Rounding.NearestDown:
				Math.fround(value * -1) * -1;
			case Rounding.NearestTowardsZero:
				value > 0 ? Math.fround(value * -1) * -1 : Math.fround(value);
			case Rounding.NearestUp:
				Math.fround(value);
		}
	}
}