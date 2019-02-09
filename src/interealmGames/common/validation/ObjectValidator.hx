package interealmGames.common.validation;
import Type;
import StringTools;
import interealmGames.common.validation.Error;

/**
 * INCOMPLETE
 * Convenience for checking API responses for correctness so proper errors can be thrown instead of silent failure (JS)
 */
class ObjectValidator 
{
	/**
	 * Not a strict regex but works for most cases
	 * https://www.regular-expressions.info/email.html
	 */
	static public var REGEX_EMAIL:EReg = ~/[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,}/i; 
	
	public function validateEmail(obj:Any, property:String, requirement:Requirement = Requirement.REQUIRED):Array<Error> {
		var errors:Array<Error> = this.validateString(obj, property, requirement);
		
		if (requirement == Requirement.NON_EMPTY) {
			if (!ObjectValidator.REGEX_EMAIL.match(Reflect.field(obj, property))){
				errors.push(Error.INVALID_FORMAT);
			}
		}
		
		return errors;
	}
	
	public function validateString(obj:Any, property:String, requirement:Requirement = Requirement.REQUIRED):Array<Error> {
		var errors:Array<Error> = [];
		
		if (!Reflect.hasField(obj, property)) {
			switch(requirement) {
				case Requirement.REQUIRED:
					errors.push(Error.MISSING_PROPERTY(property));
				case Requirement.DEFAULT_STRING(defaultValue): 
					Reflect.setProperty(obj, property, defaultValue);
				default: 1;
			}
		} else if (!Std.is(Reflect.field(obj, property), String)) {
			errors.push(Error.WRONG_TYPE);
		} else if (requirement == Requirement.NON_EMPTY && StringTools.trim(Reflect.field(obj, property)) == "") {
			errors.push(Error.EMPTY_VALUE);
		}
		
		return errors;
	}
}