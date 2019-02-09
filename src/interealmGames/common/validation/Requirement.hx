package interealmGames.common.validation;

/**
 * Value Requirments
 */
enum Requirement 
{
	NOT_REQUIRED;
	DEFAULT_STRING(defaultValue:String);
	NON_EMPTY;
	REQUIRED;
}