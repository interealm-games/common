package interealmGames.common.validation;

/**
 * Describes whether the property of an object has an error
 */
typedef PropertyResult = {
	/** Name of Propetry */
	name:String,
	message:String
}
/**
 * Describes whether an object has passed validation and what may be wrong.
 */
typedef Result =
{
	isValid:Bool,
	messages:Array<PropertyResult>
}