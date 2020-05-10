package interealmGames.common;

import utest.Assert;
import utest.Async;
import utest.Test;

typedef DupsTest<T> = {
	var array:Array<T>;
	var expected:Bool;
};
typedef EqualsTest<T> = {
	var a:Array<T>;
	var b:Array<T>;
	var expected:Bool;
};
typedef SubsetTest<T> = {
	var set:Array<T>;
	var subset:Array<T>;
	var expected:Bool;
};

/**
 * Test Suite for StringTools
 */
class ArrayToolsTest extends Test 
{

	public function testEquals() {
		var tests:Array<EqualsTest<String>> = [{
			a: ["a", "b"],
			b: ["a", "b"],
			expected: true
		}, {
			a: ["a", "b"],
			b: ["a"],
			expected: false
		}, {
			a: ["a"],
			b: ["a", "b"],
			expected: false
		}, {
			a: ["a", "b"],
			b: [],
			expected: false
		}, {
			a: [],
			b: ["a"],
			expected: false
		}];

		for(test in tests) {
			Assert.equals(test.expected, ArrayTools.equals(test.a, test.b));
		}
	}

	public function testHasDuplicates() {
		var tests:Array<DupsTest<String>> = [{
			array: ["a", "b", "c"],
			expected: false
		}, {
			array: ["a", "b", "b"],
			expected: true
		}, {
			array: ["b", "b", "b"],
			expected: true
		}, {
			array: ["b", "b", "a"],
			expected: true
		}, {
			array: [],
			expected: false
		}];

		for(test in tests) {
			Assert.equals(test.expected, ArrayTools.hasDuplicates(test.array));
		}
	}

	public function testHasSameValues() {
		var tests:Array<EqualsTest<String>> = [{
			a: ["a", "b"],
			b: ["a", "b"],
			expected: true
		}, {
			a: ["a", "b"],
			b: ["a"],
			expected: false
		}, {
			a: ["a"],
			b: ["a", "b"],
			expected: false
		}, {
			a: ["a", "b"],
			b: [],
			expected: false
		}, {
			a: [],
			b: ["a"],
			expected: false
		}, {
			a: ["a", "b"],
			b: ["b", "a"],
			expected: true
		}, {
			a: [],
			b: [],
			expected: true
		}];

		for(test in tests) {
			Assert.equals(test.expected, ArrayTools.hasSameValues(test.a, test.b));
		}
	}

	/**
	 * Basic tests for capitalization
	 */
	public function testIsSubset() {
		var tests:Array<SubsetTest<String>> = [{
			set: ["a","b","c","d"],
			subset: ["b"],
			expected: true,
		},{
			set: ["a","b","c","d"],
			subset: ["b","v"],
			expected: false,
		},{
			set: ["a","b","c","d"],
			subset: ["x"],
			expected: false,
		},{
			set: ["a","b"],
			subset: ["a","b","c"],
			expected: false,
		},{
			set: ["a","b","c","d"],
			subset: ["a","b","c"],
			expected: true,
		},{
			set: ["a","b","c","d"],
			subset: ["a","b","b"],
			expected: true,
		}];
		
		for(test in tests) {
			Assert.equals(test.expected, ArrayTools.isSubset(test.set, test.subset));
		}
	}
}
