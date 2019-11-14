package interealmGames.common.api;

/**
 * Represents a message from the Api where no data has been provided
 */
typedef StatusMessage =
{
	status:Bool,
	message:String,
	?overwrite:Bool
}
