package interealmGames.common.commandLine;

using StringTools;
using interealmGames.common.StringToolsExtension;

import interealmGames.common.commandLine.OptionSet;
import interealmGames.common.commandLine.CommandLineValues;

/**
 * Convenience functions to deal with command line usage
 */
class CommandLine 
{
	/**
	 * Gets the terminal command with the executable as a fullpath
	 * @return String The terminal command
	 */
	static public function getCommand():String {
		var command:String = Sys.programPath();

		for(arg in Sys.args()) {
			command += ' ' + arg.trim();
		}
		return command;
	}

	/**
	 * Gets the terminal command with the executable as a fullpath
	 * @return String The terminal command
	 */
	 static public function getArgs():Array<String> {
		var args: Array<String> = [Sys.programPath()];

		for(arg in Sys.args()) {
			args.push(arg.trim());
		}
		return args;
	}

	/**
	 * Parses all arguments from a terminal command, removing options
	 * @param	command String The terminal command, optional.  If not provided, it is pulled by the system.
	 * @return Array<String> All arguments in order
	 */
	static public function getArguments(?command:String):Array<String> {
		var arguments = [];
		if (command != null) {
			arguments = CommandLine.split(command);
		} else {
			arguments = CommandLine.getArgs();
		}
		
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
			} else if(argument != '') {
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
		var arguments = [];
		if (command != null) {
			arguments = CommandLine.split(command);
		} else {
			arguments = CommandLine.getArgs();
		 }
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

	static public function split(command:String):Array<String> {
		var parts = command.split(' ');
		var arguments:Array<String> = [];
		var i = 0; //loop vars cannot be modified, ie no for loop
		while (i < parts.length) {
			var argument = parts[i];

			if (['"',"'"].contains(argument.charAt(0))) {
				var quote = argument.charAt(0);
				while(argument.charAt(argument.length - 1) != quote) {
					i++;
					if(i == parts.length) {
						throw 'Missing closing quote $quote';
					}
					argument += " " + parts[i];
				}
				argument = argument.substr(1, argument.length - 2);
			}

			arguments.push(argument);
			i++;
		}

		return arguments;
	}
}
