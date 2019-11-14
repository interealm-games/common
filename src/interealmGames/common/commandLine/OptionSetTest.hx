package interealmGames.common.commandLine;

import utest.Assert;
import utest.Async;
import utest.Test;
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
class OptionSetTest extends Test 
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
			Assert.equals(test.expected, actual);
		}
	}
}
