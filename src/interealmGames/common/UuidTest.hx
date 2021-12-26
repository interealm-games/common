package interealmGames.common;

import utest.Assert;
import utest.Async;
import utest.Test;
import interealmGames.common.test.TestCase;

/**
 * Test Suite for StringTools
 */
class UuidTest extends Test 
{

	/**
	 * Basic tests for capitalization
	 */
	public function testCapitalize() {
		var tests:Array<TestCase<String, Bool>> = [{
			input: "a",
			expected: false,
		},{
			input: "cfde822d-c345-4150-863a-4701899bfbc2",
			expected: true,
		}];
		
		for(test in tests) {
			Assert.equals(test.expected, Uuid.isV4(test.input));
		}
	}
}
