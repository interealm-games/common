package interealmGames.common;

import haxe.unit.TestCase;
import interealmGames.common.test.Test;

/**
 * Test Suite for StringTools
 * @author dmcblue
 */
class StringToolsTest extends TestCase 
{

	/**
	 * Basic tests for capitalization
	 */
	public function testCapitalize()
	{
		var tests:Array<Test<String, String>> = [{
			input: "a",
			expected: "A",
		},{
			input: "A",
			expected: "A",
		},{
			input: "0a",
			expected: "0a",
		},{
			input: "!yup",
			expected: "!yup",
		},/*{
			input: "_a", // - _ ?
			expected: "",
		},*/{
			input: "this Is nice",
			expected: "This Is nice",
		}];
		
		for(test in tests) {
			assertEquals(StringTools.capitalize(test.input), test.expected);
		}
	}
	
	/**
	 * Basic tests for multiple capitalization
	 */
	public function testCapitalizeAll()
	{
		var tests:Array<Test<String, String>> = [{
			input: "a",
			expected: "A",
		},{
			input: "A",
			expected: "A",
		},{
			input: "0a",
			expected: "0a",
		},{
			input: "!yup",
			expected: "!yup",
		},/*{
			input: "_a", // - _ ?
			expected: "",
		},*/{
			input: "this Is nIce",
			expected: "This Is NIce",
		}];
		
		for(test in tests) {
			assertEquals(StringTools.capitalizeAll(test.input), test.expected);
		}
		assertEquals(
			StringTools.capitalizeAll("allbeesarebeeutiful", "b"), 
			"AllbEesarebEeutiful"
		);
	}
}