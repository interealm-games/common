package interealmGames.common.serializer.object;

/**
 * 
 */
class Json<T> implements Serializer<T> 
{

	public function new() {}
	
	
	/* INTERFACE interealmGames.common.serializer.object.Serializer.Serializer<T> */
	
	public function decode(s:String):T 
	{
		var item:T = cast haxe.Json.parse(s);
		return item;
	}
	
	public function encode(t:T):String 
	{
		return haxe.Json.stringify(t);
	}
}