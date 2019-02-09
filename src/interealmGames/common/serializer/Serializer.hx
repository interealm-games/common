package interealmGames.common.serializer;

/**
 * ...
 */
interface Serializer 
{
	public function decode(s:String):Dynamic;
	public function encode(t:Dynamic):String;
}