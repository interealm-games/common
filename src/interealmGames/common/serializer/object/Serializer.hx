package interealmGames.common.serializer.object;

/**
 * 
 */
interface Serializer<T> 
{
	public function decode(s:String):T;
	public function encode(t:T):String;
}