package interealmGames.common.commandLine;

import haxe.unit.TestCase;
import interealmGames.common.commandLine.OptionSet;
import interealmGames.common.commandLine.OptionType;

typedef FormatFlagTest = {
	flag:String,
	type:Null<OptionType>,
	expected:Null<String>
}

/**
 * Tests the OptionSet class
 */
class OptionSetTest extends TestCase 
{
	/**
	 * Basic tests for unquote
	 */
	public function testFormatFlag()
	{
		//formatFlag(flag:String, type:Null<OptionType> = null):Null<String>
		var tests:Array<FormatFlagTest> = [{
			flag:"--help",
			type:null,
			expected:"help"
		},{
			flag:"-help",
			type:null,
			expected:"help"
		},{ //expect this bad outcome, for now
			flag:"--help",
			type: OptionType.SHORT,
			expected:"-help"
		},{ //expect this bad outcome, for now
			flag:"-help",
			type: OptionType.LONG,
			expected:"elp"
		}];
		
		var options = new OptionSet();
		
		for (test in tests) {
			var actual = options.formatFlag(test.flag, test.type);
			assertEquals(test.expected, actual);
		}
	}
}