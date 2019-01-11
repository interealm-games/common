package interealmGames.common;

using interealmGames.common.StringToolsExtension; //self reference

import StringTools in Parent;

/**
 * Extends the Standard StringTools
 */
class StringToolsExtension 
{
	/**
	 * Takes a string and returns a string with the first character in upper case
	 * Does not capitalize in place.
	 * @param	str The string to capitalize
	 * @return The capitalized string
	 */
	static public function capitalize(cl:Class<Parent>, str:String):String {
		return str.charAt(0).toUpperCase() + str.substr(1);
	}

	/**
	 * Capitalizes substrings in a string defined by a delimiter
	 * With the default delimiter, 'hi there' becomes 'Hi There'.
	 * @param	str The string to capitalize
	 * @param	delimiter The delimiter to split the string
	 * @return The capitalized string
	 */
	static public function capitalizeAll(cl:Class<Parent>, str:String, delimiter:String = " "):String {
		return str.split(delimiter).map(Parent.capitalize).join(delimiter);
	}
	
	/**
	 * Replaces each instance of a 
	 * @param	str
	 * @param	replacements
	 * @param	placeholder = "%s
	 */
	static public function format(cl:Class<Parent>, str:String, replacements:Array<String>, placeholder = "%s") {
		var newString = str;
		
		for (replacement in replacements) {
			newString = Parent.replaceOnce(newString, placeholder, replacement);
		}
		
		return newString;
	}
	
	/**
	 * Replaces a single occurence (first from left) of a substring with another.
	 * Creates new string, ie. not in place.
	 * @param	str 
	 * @param	sub
	 * @param	by
	 * @return
	 */
	static public function replaceOnce(cl:Class<Parent>, str:String, sub:String, by:String):String {
		var subPosition = str.indexOf(sub);
		
		if (subPosition == -1) {
			return str;
		}
		
		var beginning = str.substring(0, subPosition);
		var end = str.substring(subPosition + sub.length);
		return beginning + by + end;
	}
	
	/**
	 * Splices in a new part of the string, potentially replacing an old part
	 * @param subject String The string to splice
	 * @param start Int starting position of the splice
	 * @param length Int Length of characters to remove, default 0.
	 * @param replacement String Optional what to put in the removed area.
	 */
	static public function splice(cl:Class<Parent>, subject:String, start:Int, length = 0, replacement = '') {
		return subject.substr(0, start) + replacement + subject.substr(start + length);
	}
	
	/**
	 * Returns a new string without surrounding quotations
	 * @param	string The string to remove quotes from
	 * @param	quotes Array of quote types, defaults to single quote
	 * @return  string A new string without the quotes
	 */
	static public function unquote(cl:Class<Parent>, string:String, ?quotes:Array<String>):String {
		if (quotes == null) {
			quotes = ["'", '"'];
		}
		
		var output = string;
		for (quote in quotes) {
			if (output.length > 1) {
				var firstIndex = output.indexOf(quote);
				if (output.charAt(output.length - firstIndex - 1) == quote) {
					
				}
			}
			
			if (output.length > 1 && output.charAt(0) == quote && output.charAt(output.length - 1) == quote) {
				output = output.substr(1, output.length - 2);
			}
		}
		
		return output;
	}
}
