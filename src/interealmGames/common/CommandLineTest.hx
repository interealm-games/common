package interealmGames.common;

import haxe.unit.TestCase;
import interealmGames.common.CommandLine;

typedef GetArgumentsText = {
	input:String,
	expected:Array<String>
}
/**
 * ...
 * @author ...
 */
class CommandLineTest extends TestCase 
{
	/**
	 * Basic tests for unquote
	 */
	public function testGetArguments()
	{
		var tests:Array<GetArgumentsText> = [{
			input: "billy -h filious bobby",
			expected: ["billy","bobby"]
		},{
			input: "billy -h=filious bobby flobby",
			expected: ["billy","bobby","flobby"]
		},{
			input: "billy -h='filious' bobby",
			expected: ["billy","bobby"]
		},{
			input: "billy -h 'filious' bobby",
			expected: ["billy","bobby"]
		}];
		
		for (test in tests) {
			var actual = CommandLine.getArguments(test.input);
			assertEquals(test.expected.length, actual.length);
			for (i in 0...actual.length) {
				if(i < test.expected.length) {
					assertEquals(test.expected[i], actual[i]);
				}
			}
		}
	}
	
	/**
	 * Basic tests for unquote
	 */
	public function testGetOptions()
	{
		var command = "program -r -f filename.txt valve.mp3 -d=\"tests/unit\" -d lib --input 'audio' output.wav";
		var actual = CommandLine.getOptions(command);
		assertTrue(actual.exists('r'));
		assertEquals(0, actual.get('r').length);
		
		assertTrue(actual.exists('f'));
		assertEquals(1, actual.get('f').length);
		assertEquals('filename.txt', actual.get('f')[0]);
		trace(actual);
		assertTrue(actual.exists('d'));
		assertEquals(2, actual.get('d').length);
		assertEquals('tests/unit', actual.get('d')[0]);
		assertEquals('lib', actual.get('d')[1]);
		
		assertTrue(actual.exists('input'));
		assertEquals(1, actual.get('input').length);
		assertEquals('audio', actual.get('input')[0]);
	}
}