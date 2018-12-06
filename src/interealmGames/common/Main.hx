package interealmGames.common;

import haxe.unit.TestRunner;

/**
 * ...
 * @author dmcblue
 */
class Main 
{
	
	static function main() 
	{
		var r:TestRunner = new TestRunner();
		r.add(new StringToolsTest());
		r.add(new ArrayToolsTest());

		r.run();
	}
	
}