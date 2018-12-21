package interealmGames.common;

import Map in Dictionary;
import interealmGames.common.StringTools;
/**
 * ...
 * @author ...
 */
class CommandLine 
{
	static public function getOptions(?arguments:Array<String>):Dictionary<String, Array<String>> {
		/*
		 * On Windows at least:
		 *  - Double quotes are removed around arguments
		 *  - But not singles
		 *  - Equals (=) are just text
		 */
		if (arguments == null) {
			arguments = Sys.args();
		}
		var options:Dictionary<String, Array<String>> = new Dictionary();
		
		var i = 0; //loop vars cannot be modified, ie no for loop
		while (i < arguments.length) {
			trace(arguments[i]);
			var argument = arguments[i];
			if (argument.charAt(0) == '-') {
				var secondArgument:Null<String> = null;
				
				if (argument.indexOf('=') > -1) {
					var splits = argument.split('=');
					if (splits.length > 1) {
						splits.shift();
						secondArgument = splits.join('=');
					}
				} else if(i < arguments.length - 1) {
					if(arguments[i + 1].charAt(0) != '-') {
						secondArgument = arguments[i + 1];
						i++;
					}
				}
				
				if (!options.exists(argument)) {
					options.set(argument, []);
				}
				
				if (secondArgument != null) {
					options.get(argument).push(StringTools.unquote(secondArgument));
				}
			}
			
			i++;
		}
		
		return options;
	}
}