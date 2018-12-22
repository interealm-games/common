package interealmGames.common;

using interealmGames.common.StringToolsExtension;

import haxe.unit.TestCase;
import interealmGames.common.test.Test;


typedef FormatTest = {
	var str: String;
	var placeholder: String;
	var replacements: Array<String>;
	var expected: String;
};
typedef ReplacementTest = {
	var str: String;
	var sub: String;
	var by: String;
	var expected: String;
};
typedef SpliceTest = {
	var subject: String;
	var start: Int;
	var length: Int;
	var replacement: String;
	var expected: String;
};
typedef UnquoteTest = {
	input:String,
	quotes:Null<Array<String>>,
	expected:String
}
/**
 * Test Suite for StringTools
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
			assertEquals(test.expected, StringTools.capitalize(test.input));
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
			assertEquals(test.expected, StringTools.capitalizeAll(test.input));
		}
		assertEquals(
			"AllbEesarebEeutiful",
			StringTools.capitalizeAll("allbeesarebeeutiful", "b")
		);
	}
	
	public function testFormat()
	{
		var tests:Array<FormatTest> = [{
			str: "Sara %s mangos",
			placeholder: "%s",
			replacements: ["likes"],
			expected: "Sara likes mangos"
		},{
			str: "Sara mangos",
			placeholder: "%s",
			replacements: ["likes"],
			expected: "Sara mangos"
		},{
			str: "Sara %d mangos %d",
			placeholder: "%d",
			replacements: ["likes"],
			expected: "Sara likes mangos %d"
		},{
			str: "Sara %d mangos %d.",
			placeholder: "%d",
			replacements: ["likes","a lot"],
			expected: "Sara likes mangos a lot."
		}];
	
		for(test in tests) {
			assertEquals(
				test.expected,
				StringTools.format(test.str, test.replacements, test.placeholder)
			);
		}
	}
	
	public function testReplaceOnce()
	{
		var tests:Array<ReplacementTest> = [{
			str: "Sara %s mangos",
			sub: "%s",
			by: "likes",
			expected: "Sara likes mangos"
		},{
			str: "Sara mangos",
			sub: "%s",
			by: "likes",
			expected: "Sara mangos"
		}];
		
		for(test in tests) {
			assertEquals(
				test.expected,
				StringTools.replaceOnce(test.str, test.sub, test.by)
			);
		}
	}
	
	/**
	 * Basic tests for splicing strings
	 */
	public function testSplice()
	{
		var tests:Array<SpliceTest> = [{
			subject: "billy",
			start: 1,
			length: 1,
			replacement: "", //default
			expected: "blly"
		},{
			subject: "billy",
			start: 1,
			length: 3,
			replacement: "obb", //default
			expected: "bobby"
		}];
		
		for(test in tests) {
			assertEquals(test.expected, StringTools.splice(test.subject, test.start, test.length, test.replacement));
		}
	}
	
	/**
	 * Basic tests for unquote
	 */
	public function testUnquote()
	{
		var tests:Array<UnquoteTest> = [{
			input: "billy",
			quotes: null, //default
			expected: "billy"
		},{
			input: "'billy'",
			quotes: null, //default
			expected: "billy"
		},{
			input: '"billy"',
			quotes: ['"', "'"],
			expected: "billy"
		}];
		
		for(test in tests) {
			assertEquals(test.expected, StringTools.unquote(test.input, test.quotes));
		}
	}
}