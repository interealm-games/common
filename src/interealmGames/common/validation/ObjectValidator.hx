package interealmGames.common.validation;
import Type;
import StringTools;

/**
 * Convenience for checking API responses for correctness so proper errors can be thrown instead of silent failure (JS)
 */
class ObjectValidator 
{
	static private var ERROR_EMPTY_VALUE = "Empty value for Property '%s' in object of type '%t'";
	static private var ERROR_MISSING_PROPERTY = "Missing Property '%s' in object of type '%t'";
	static private var ERROR_WRONG_PROPERTY_TYPE = "Property '%s' of object type '%t' in type '%u' instead of type '%v'";
	
	public static function validateString(obj:Any, property:String, ?requirement:Requirement) {
		if (requirement == null) {
			requirement = Requirement.REQUIRED;
		}
		
		if (!Reflect.hasField(obj, property)) {
			switch(requirement) {
				case Requirement.REQUIRED:
					throw ObjectValidator.formErrorMissingProperty(obj, property);
				case Requirement.DEFAULT: 
					Reflect.setProperty(obj, property, "");
				case Requirement.NON_EMPTY:
					throw ObjectValidator.formErrorMissingProperty(obj, property);
				case Requirement.NOT_REQUIRED:
					trace(ObjectValidator.formErrorMissingProperty(obj, property));
			}
		  //Reflect.setProperty(this, prop, Reflect.getProperty(props, prop));
		} else if (!Std.is(Reflect.field(obj, property), String)) {
			throw ObjectValidator.formWrongPropertyType(obj, property, String);
		} else if (requirement == Requirement.NON_EMPTY && StringTools.trim(Reflect.field(obj, property)) == "") {
			trace('jere');
			trace(property);
			trace(Reflect.field(obj, property));
			trace(ObjectValidator.formErrorEmptyValue(obj, property));
			var error = ObjectValidator.formErrorEmptyValue(obj, property);
			throw error;
			throw 'someothererrror';
			throw ObjectValidator.formErrorEmptyValue(obj, property);
			trace('more');
		}
	}
	
	private static function formErrorEmptyValue(obj:Any, property:String) {
		var error = StringTools.replace(ObjectValidator.ERROR_EMPTY_VALUE, '%s', property);
		error = StringTools.replace(error, '%t', Std.string(Type.typeof(obj)));
		return error;
	}
	
	private static function formErrorMissingProperty(obj:Any, property:String) {
		var error = StringTools.replace(ObjectValidator.ERROR_MISSING_PROPERTY, '%s', property);
		error = StringTools.replace(error, '%t', Type.getClassName(obj));
		return error;
	}
	
	private static function formWrongPropertyType(obj:Any, property:String, correctType:Class<Dynamic>) {
		var error = StringTools.replace(ObjectValidator.ERROR_WRONG_PROPERTY_TYPE, '%s', property);
		error = StringTools.replace(error, '%t', Type.getClassName(obj));
		error = StringTools.replace(error, '%u', Std.string(Type.typeof(Reflect.field(obj, property))));
		error = StringTools.replace(error, '%v', Std.string(correctType));
		return error;
	}
}