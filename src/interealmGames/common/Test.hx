package interealmGames.common;

import haxe.unit.TestRunner;
import interealmGames.common.commandLine.CommandLineTest;
import interealmGames.common.commandLine.OptionSetTest;

/**
 * All tests for this package
 */
class Test 
{

	static function main() 
	{
		var r:TestRunner = new TestRunner();
		r.add(new StringToolsTest());
		r.add(new ArrayToolsTest());
		r.add(new CommandLineTest());
		r.add(new OptionSetTest());

		r.run();
	}
	
}