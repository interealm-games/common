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
}
