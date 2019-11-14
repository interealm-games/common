package interealmGames.common.commandLine;

import utest.Assert;
import utest.Async;
import utest.Test;
import interealmGames.common.commandLine.CommandLine;

typedef GetArgumentsText = {
	input:String,
	expected:Array<String>
}
/**
 * Tests the CommandLine class
 */
class CommandLineTest extends Test 
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
			Assert.equals(test.expected.length, actual.length);
			for (i in 0...actual.length) {
				if(i < test.expected.length) {
					Assert.equals(test.expected[i], actual[i]);
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
		Assert.isTrue(actual.hasShortOption('r'));
		Assert.equals(0, actual.getShortValues('r').length);
		
		Assert.isTrue(actual.hasShortOption('f'));
		Assert.equals(1, actual.getShortValues('f').length);
		Assert.equals('filename.txt', actual.getShortValues('f')[0]);
		
		Assert.isTrue(actual.hasShortOption('d'));
		Assert.equals(2, actual.getShortValues('d').length);
		Assert.equals('tests/unit', actual.getShortValues('d')[0]);
		Assert.equals('lib', actual.getShortValues('d')[1]);
		
		Assert.isTrue(actual.hasLongOption('input'));
		Assert.equals(1, actual.getLongValues('input').length);
		Assert.equals('audio', actual.getLongValues('input')[0]);
	}
}
