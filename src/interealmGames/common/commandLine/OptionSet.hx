package interealmGames.common.commandLine;

import haxe.Json as JSON;
import Map in Dictionary;
import interealmGames.common.commandLine.OptionType;

/**
 * Represents all options indicated by a user at the command line / terminal
 */
class OptionSet 
{
	/** Options with a single hyphen - */
	var short:Dictionary<String, Array<String>> = new Dictionary();
	/** Options with two hyphens - */
	var long:Dictionary<String, Array<String>> = new Dictionary();
	
	public function new() 
	{
		
	}
	
	/**
	 * Adds a value to a set with a flag that still has hyphens
	 * @param	optionFlag The flag with hyphens
	 * @param	value The value to add to the set
	 */
	public function addRawValue(optionFlag:String, value:String):Void {
		var type = this.getFlagType(optionFlag);
		var flag = this.formatFlag(optionFlag, type);
		
		if (type != null && flag != null) {
			this.addValue(type, flag, value);
		}
	}
	
	/**
	 * Adds a value to the set for the flag
	 * @param	type Type of option flag
	 * @param	optionFlag The option flag without hyphens
	 * @param	value The value to add to the set
	 */
	public function addValue(type:OptionType, optionFlag:String, value:String):Void {
		this.checkOption(type, optionFlag);
		
		if (type == OptionType.LONG) {
			this.long.get(optionFlag).push(value);
		} else {
			this.short.get(optionFlag).push(value);
		}
	}
	
	/**
	 * Convenience function wrapping addValue for all long flags
	 * @param	optionFlag The option flag without hyphens
	 * @param	value The value to add to the set
	 */
	public function addLongValue(optionFlag:String, value:String):Void {
		this.addValue(OptionType.LONG, optionFlag, value);
	}
	
	/**
	 * Convenience function wrapping addValue for all short flags
	 * @param	optionFlag The option flag without hyphens
	 * @param	value The value to add to the set
	 */
	public function addShortValue(optionFlag:String, value:String):Void {
		this.addValue(OptionType.SHORT, optionFlag, value);
	}
	
	/**
	 * Indicates that an option flag appears at least once
	 * @param	type  Type of option flag
	 * @param	optionFlag The option flag without hyphens
	 */
	public function checkOption(type:OptionType, optionFlag:String):Void {
		switch(type) {
			case OptionType.LONG:
				if (!this.long.exists(optionFlag)) {
					this.long.set(optionFlag, []);
				}
			case OptionType.SHORT:
				if (!this.short.exists(optionFlag)) {
					this.short.set(optionFlag, []);
				}
		}
	}
	
	/**
	 * Conveniece function wrapping checkOption for long options
	 * @param	optionFlag The option flag without hyphens
	 */
	public function checkLongOption(optionFlag:String):Void {
		this.checkOption(OptionType.LONG, optionFlag);
	}
	
	/**
	 * Conveniece function wrapping checkOption for short options
	 * @param	optionFlag The option flag without hyphens
	 */
	public function checkShortOption(optionFlag:String):Void {
		this.checkOption(OptionType.SHORT, optionFlag);
	}
	
	/**
	 * Takes the flag with hypens and removes the hyphens if there are an appropriate amount
	 * @param	flag The string with a flag, ie '-x' or '--x'
	 * @param	type Optional Type information, type will be found automatically if not provided.
	 * @return The flag without hyphens if it is a valid flag, otherwise null.
	 */
	public function formatFlag(flag:String, type:Null<OptionType> = null):Null<String> {
		if(type == null) {
			type = this.getFlagType(flag);
		}
		
		return switch(type) {
			case OptionType.LONG: flag.substr(2);
			case OptionType.SHORT: flag.substr(1);
			case null: null;
		}
	}
	
	/**
	 * Takes a raw flag string, with hypens, and returns the option type.
	 * @param	flag  The flag with hyphens
	 * @return The option flag without hyphens if valid, null otherwise.
	 */
	public function getFlagType(flag:String):Null<OptionType> {
		if (flag.length > 1 && flag.charAt(0) == '-') {
			if (flag.length > 2 && flag.charAt(1) == '-' && flag.charAt(2) != '-') {
				return OptionType.LONG;
			}
			
			return OptionType.SHORT;
		}
		
		return null;
	}
	
	/**
	 * Returns all values for a flag
	 * @param	type Type of option
	 * @param	flag The option flag without hyphens
	 * @return An array of values
	 */
	public function getValues(type:OptionType, flag:String):Array<String> {
		var arr:Null<Array<String>> = [];
		
		switch(type) {
			case OptionType.LONG: 
				arr = this.long.get(flag);
			case OptionType.SHORT: 
				arr = this.short.get(flag);
		}
		
		return arr != null ? arr : [];
	}
	
	/**
	 * Convenience function wrapping getValues for long flags
	 * @param	flag The option flag without hyphens
	 * @return An array of values
	 */
	public function getLongValues(flag:String):Array<String> {
		return this.getValues(OptionType.LONG, flag);
	}
	
	/**
	 * Convenience function wrapping getValues for short flags
	 * @param	flag The option flag without hyphens
	 * @return An array of values
	 */
	public function getShortValues(flag:String):Array<String> {
		return this.getValues(OptionType.SHORT, flag);
	}
	
	/**
	 * Whether the option flag appears at the terminal
	 * @param	type Option type
	 * @param	flag The option flag without hyphens
	 * @return boolean
	 */
	public function hasOption(type:OptionType, flag:String):Bool {
		return switch(type) {
			case OptionType.LONG: this.long.exists(flag);
			case OptionType.SHORT: this.short.exists(flag);
		}
	}
	
	/**
	 * Convenience function wrapping hasOption for long flags
	 * @param	flag The option flag without hyphens
	 * @return boolean
	 */
	public function hasLongOption(flag:String):Bool {
		return this.hasOption(OptionType.LONG, flag);
	}
	
	/**
	 * Convenience function wrapping hasOption for long flags
	 * @param	flag The option flag without hyphens
	 * @return boolean
	 */
	public function hasShortOption(flag:String):Bool {
		return this.hasOption(OptionType.SHORT, flag);
	}

	public function toString():String {
		var map = {};
		// in php the data attr of the dictionaries becomes
		// part of the JSON output, so we need to circumvent
		// this
		// for(key => value in this.long) {
		// 	map[key] = value;
		// }

		// for(key => value in this.short) {
		// 	map[key] = value;
		// }

		// return JSON.stringify(this);
		return this.long.toString() + this.short.toString();
	}
}
