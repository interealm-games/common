package interealmGames.common.serializer;

import haxe.Json as JSON;
/**
 * ...
 * @author dmcblue
 */
class Json<T> implements Serializer<T> 
{

	public function new() 
	{
		
	}
	
	
	/* INTERFACE interealmGames.editorBackend.serializer.Serializer.Serializer<T> */
	
	public function decode(s:String):T 
	{
		var item:T = cast JSON.parse(s);
		return item;
	}
	
	public function encode(t:T):String 
	{
		return JSON.stringify(t);
	}
}