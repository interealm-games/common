package interealmGames.common.serializer;

import haxe.Json as JSON;
/**
 * ...
 */
class Json implements Serializer
{

	public function new() {}
	
	
	/* INTERFACE interealmGames.editorBackend.serializer.Serializer.Serializer<T> */
	
	public function decode(s:String):Dynamic 
	{
		return JSON.parse(s);
	}
	
	public function encode(t:Dynamic):String 
	{
		return JSON.stringify(t);
	}
}
