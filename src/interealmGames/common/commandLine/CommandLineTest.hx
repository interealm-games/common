package interealmGames.common.commandLine;

import haxe.unit.TestCase;
import interealmGames.common.commandLine.CommandLine;

typedef GetArgumentsText = {
	input:String,
	expected:Array<String>
}
/**
 * Tests the CommandLine class
 */
class CommandLineTest extends TestCase 
{
	/**
	 * Basic tests for getArguments
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
	 * Basic tests for getOptions
	 */
	public function testGetOptions()
	{
		var command = "program -r -f filename.txt valve.mp3 -d=\"tests/unit\" -d lib --input 'audio' output.wav";
		var actual = CommandLine.getOptions(command);
		assertTrue(actual.hasShortOption('r'));
		assertEquals(0, actual.getShortValues('r').length);
		
		assertTrue(actual.hasShortOption('f'));
		assertEquals(1, actual.getShortValues('f').length);
		assertEquals('filename.txt', actual.getShortValues('f')[0]);
		
		assertTrue(actual.hasShortOption('d'));
		assertEquals(2, actual.getShortValues('d').length);
		assertEquals('tests/unit', actual.getShortValues('d')[0]);
		assertEquals('lib', actual.getShortValues('d')[1]);
		
		assertTrue(actual.hasLongOption('input'));
		assertEquals(1, actual.getLongValues('input').length);
		assertEquals('audio', actual.getLongValues('input')[0]);
	}
}