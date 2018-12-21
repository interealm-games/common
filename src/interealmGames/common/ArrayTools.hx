package interealmGames.common;

import Map in Dictionary;

/**
 * Utilities for arrays
 */
class ArrayTools 
{
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
	 * Determines whether the second array's values are a subset of the first
	 */
	static public function isSubset<T>(set:Array<T>, subset:Array<T>):Bool {
		var dictionary:Dictionary<String, Int> = new Dictionary();
		
		/*
		Length shouldn't matter since a set/array could have duplicate values
		if (set.length < subset.length) {
			return false;
		}
		//*/
		
		for (item in set) {
			//trace();
			dictionary.set(Std.string(item), 0);
		}
		
		for (item in subset) {
			if (!dictionary.exists(Std.string(item))) {
				return false;
			}
			var i = dictionary.get(Std.string(item));
			dictionary.set(Std.string(item), i + 1);
		}
		
		/*
		for (item in dictionary) {
			if (item > 1) {
				return false;
			}
		}
		//*/
		
		return true;
	}
	
	
	private function new() 
	{
		
	}
}