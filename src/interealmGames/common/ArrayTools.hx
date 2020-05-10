package interealmGames.common;

import Map in Dictionary;

/**
 * Utilities for arrays
 */
class ArrayTools 
{
	/**
	 * If all values are the same and in the same order
	 */
	static public function equals<T>(a:Array<T>, b:Array<T>): Bool {
		if (a.length != b.length) {
			return false;
		}

		var isEqual = true;
		for (i in 0...a.length) {
			isEqual = isEqual && a[i] == b[i];
		}

		return isEqual;
	}

	/**
	 * Determines whether there are duplicate values
	 * Not sure if this is trustworthy.
	 * Probably slower than using indexOf
	 */
	static public function hasDuplicates<T>(set:Array<T>):Bool {
		var dictionary:Dictionary<String, Int> = new Dictionary();
		
		for (item in set) {
			if (dictionary.exists(Std.string(item))) {
				return true;
			}
			dictionary.set(Std.string(item), 0);
		}
		
		return false;
	}

	/**
	 * If all values are the same and but the order might be different
	 */
	static public function hasSameValues<T>(a:Array<T>, b:Array<T>):Bool {
		if (a.length != b.length) {
			return false;
		}

		var isEqual = true;
		for (item in a) {
			isEqual = isEqual && b.indexOf(item) > -1;
		}

		return isEqual;
	}
	
	/**
	 * Determines whether the second array's values are a subset of the first
	 */
	static public function isSubset<T>(set:Array<T>, subset:Array<T>):Bool {
		var dictionary:Dictionary<String, Int> = new Dictionary();
		
		for (item in set) {
			dictionary.set(Std.string(item), 0);
		}
		
		for (item in subset) {
			if (!dictionary.exists(Std.string(item))) {
				return false;
			}
			var i = dictionary.get(Std.string(item));
			dictionary.set(Std.string(item), i + 1);
		}
		
		return true;
	}
	
	
	private function new() 
	{
		
	}
}
