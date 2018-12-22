package interealmGames.common;

using interealmGames.common.StringToolsExtension;

import Map in Dictionary;
/**
 * ...
 * @author ...
 */
class CommandLine 
{
	static public function getCommand() {
		return Sys.programPath() + ' ' + Sys.args().join(' ');
	}
	
	static public function getArguments(?command:String):Array<String> {
		if (command == null) {
			command = CommandLine.getCommand();
		}
		var arguments = command.split(' ');
		
		var args:Array<String> = [];
		
		var i = 0; //loop vars cannot be modified, ie no for loop
		while (i < arguments.length) {
			var argument = arguments[i];
			if (argument.charAt(0) == '-') {
				if(argument.indexOf('=') == -1 && i < arguments.length - 1) {
					if(arguments[i + 1].charAt(0) != '-') {
						i++;
					}
				}
			} else {
				args.push(argument);
			}
			
			i++;
		}
		
		return args;
	}
	
	static public function getOptions(?command:String):Dictionary<String, Array<String>> {
		/*
		 * On Windows at least:
		 *  - Double quotes are removed around arguments
		 *  - But not singles
		 *  - Equals (=) are just text
		 */
		if (command == null) {
			command = CommandLine.getCommand();
		}
		var arguments = command.split(' ');
		var options:Dictionary<String, Array<String>> = new Dictionary();
		
		var i = 0; //loop vars cannot be modified, ie no for loop
		while (i < arguments.length) {
			var argument = arguments[i];
			if (argument.charAt(0) == '-') {
				var secondArgument:Null<String> = null;
				
				if (argument.indexOf('=') > -1) {
					var splits = argument.split('=');
					if (splits.length > 1) {
						argument = splits.shift();
						secondArgument = splits.join('=');
					}
				} else if(i < arguments.length - 1) {
					if (arguments[i + 1].charAt(0) != '-') {
						secondArgument = arguments[i + 1];
						i++;
					}
				}
				
				while (argument.length > 0 && argument.charAt(0) == '-') {
					argument = argument.substring(1);
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