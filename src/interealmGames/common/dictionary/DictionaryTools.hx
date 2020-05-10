package interealmGames.common.dictionary;

/**
 * Adds Utility to the Map class
 */
class DictionaryTools
{
	/**
	 * Creates a Map object from a Dynamic literal
	 */
	static public function fromLiteral<V>(object: Dynamic): Map<String, V> {
		var map:Map<String, V> = new Map();
		
		for (property in Reflect.fields(object)) {
			map.set(property, Reflect.field(object, property));
		}

		return map;
	}

	/**
	 * Returns the number of Key/Value pairs in a Map
	 */
	static public function size<K, V>(map:Map<K, V>):Int {
		var size:Int = 0;
		for (value in map) {
			size++;
		}
		return size;
	}

	/**
	 * @deprecated
	 * Gets all values
	 * Alias of #values
	 */
	static public function toArray<K, V>(map:Map<K, V>):Array<V> {
		var arr:Array<V> = [];
		for (value in map) {
			arr.push(value);
		}
		return arr;
	}

	/**
	 * Gets all values
	 */
	static public function values<K, V>(map:Map<K, V>):Array<V> {
		return DictionaryTools.toArray(map);
	}
}
