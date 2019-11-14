package interealmGames.common.validation;

/**
 * Validation Errors
 */
enum Error 
{
	EMPTY_VALUE;
	INVALID_FORMAT;
	MISSING_PROPERTY(propertyName:String);
	WRONG_TYPE;
}
