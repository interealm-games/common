package interealmGames.common;

import haxe.unit.TestRunner;

/**
 * ...
 * @author ...
 */
class Test 
{

	static function main() 
	{
		var r:TestRunner = new TestRunner();
		r.add(new StringToolsTest());
		r.add(new ArrayToolsTest());
		r.add(new CommandLineTest());

		r.run();
	}
	
}