package interealmGames.common;

import StringTools in Parent;

/**
 * Extends the Standard StringTools
 * @author dmcblue
 */
class StringTools extends Parent 
{
	/**
	 * Takes a string and returns a string with the first character in upper case
	 * Does not capitalize in place.
	 * @param	str The string to capitalize
	 * @return The capitalized string
	 */
	static public function capitalize(str:String):String {
		return str.charAt(0).toUpperCase() + str.substr(1);
	}

	/**
	 * Capitalizes substrings in a string defined by a delimiter
	 * With the default delimiter, 'hi there' becomes 'Hi There'.
	 * @param	str The string to capitalize
	 * @param	delimiter The delimiter to split the string
	 * @return The capitalized string
	 */
	static public function capitalizeAll(str:String, delimiter:String = " "):String {
		return str.split(delimiter).map(StringTools.capitalize).join(delimiter);
	}
	
	/**
	 * Replaces each instance of a 
	 * @param	str
	 * @param	replacements
	 * @param	placeholder = "%s
	 */
	static public function format(str:String, replacements:Array<String>, placeholder = "%s") {
		var newString = str;
		
		for (replacement in replacements) {
			newString = StringTools.replaceOnce(newString, placeholder, replacement);
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
	static public function replaceOnce(str:String, sub:String, by:String):String {
		var subPosition = str.indexOf(sub);
		
		if (subPosition == -1) {
			return str;
		}
		
		var beginning = str.substring(0, subPosition);
		var end = str.substring(subPosition + sub.length);
		return beginning + by + end;
	}
}
