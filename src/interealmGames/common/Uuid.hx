package interealmGames.common;

import com.hurlant.crypto.prng.Random;
import com.hurlant.crypto.extra.UUID;

/**
 * Uuid Wrapper
 */
class Uuid 
{
	public static function v4():String {
		var rand = new Random();
		var uuid = UUID.generateRandom(rand);
		return uuid.toString();
	}
}
