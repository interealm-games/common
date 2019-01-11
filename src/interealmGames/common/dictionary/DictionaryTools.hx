package interealmGames.common.dictionary;

//import interealmGames.common.dictionary.KeyValuePair;

/**
 * Adds Utility to the Map class
 */
class DictionaryTools
{
	/*
	static public function fromPairs<K, V>(arr:Array<KeyValuePair<K, V>>):Map<K, V> {
		var map:Map<K, V> = new Map();

		for (row in arr) {
			map.set(row.key, row.value);
		}

		return map;
	}//*/
	
	static public function size<K, V>(map:Map<K, V>):Int {
		var size:Int = 0;
		for (value in map) {
			size++;
		}
		return size;
	}
	
	static public function toArray<K, V>(map:Map<K, V>):Array<V> {
		var arr:Array<V> = [];
		for (value in map) {
			arr.push(value);
		}
		return arr;
	}
	/*
	static public function toPairs<K, V>(map:Map<K, V>):Array<KeyValuePair<K, V>> {
		var arr:Array<KeyValuePair<K, V>> = [];
		
		for (key in map.keys()) {
			arr.push({
				key: key,
				value: map.get(key)
			});
		}
		
		return arr;
	}//*/
}