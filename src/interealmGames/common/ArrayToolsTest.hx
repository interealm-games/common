package interealmGames.common;

import utest.Assert;
import utest.Async;
import utest.Test;

typedef SubsetTest<T> = {
	var set: Array<T>;
	var subset: Array<T>;
	var expected: Bool;
};
/**
 * Test Suite for StringTools
 */
class ArrayToolsTest extends Test 
{

	/**
	 * Basic tests for capitalization
	 */
	public function testIsSubset()
	{
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