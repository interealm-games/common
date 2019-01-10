package interealmGames.common.commandLine;

using interealmGames.common.StringToolsExtension;

import Map in Dictionary;
import interealmGames.common.commandLine.OptionType;
import interealmGames.common.commandLine.OptionSet;

/**
 * ...
 * @author ...
 */
class CommandLine 
{
	/**
	 * Gets the terminal command with the executable as a fullpath
	 * @return String The terminal command
	 */
	static public function getCommand():String {
		return Sys.programPath() + ' ' + Sys.args().join(' ');
	}
	
	/**
	 * Parses all arguments from a terminal command, removing options
	 * @param	command String The terminal command, optional.  If not provided, it is pulled by the system.
	 * @return Array<String> All arguments in order
	 */
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
	
	/**
	 * Parses all options from a terminal command, removing other arguments
	 * @param	command String The terminal command, optional.  If not provided, it is pulled by the system.
	 * @return Map<String, Array<String>> A Map whose keys are the option flags ('-'s are removed) and whose values are arrays of strings
	 */
	static public function getOptions(?command:String):OptionSet {
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
		var options:OptionSet = new OptionSet();
		
		var i = 0; //loop vars cannot be modified, ie no for loop
		while (i < arguments.length) {
			var argument = arguments[i];
			var type = options.getFlagType(argument);
			if (type != null) {
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
				
				//format flag
				var flag = options.formatFlag(argument, type);
				
				if (secondArgument != null) {
					secondArgument = StringTools.unquote(secondArgument);
					options.addValue(type, flag, secondArgument);
				} else {
					options.checkOption(type, flag);
				}
			}
			
			i++;
		}
		
		return options;
	}
}