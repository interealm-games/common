package interealmGames.common.api;

/**
 * Represents a message from the Api where no data has been provided
 */
typedef StatusMessage =
{
	var status:Bool;
	var message:String;
	var overwrite:Bool;
}