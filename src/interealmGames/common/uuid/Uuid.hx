package interealmGames.common.uuid;

import com.hurlant.crypto.prng.Random;
import com.hurlant.crypto.extra.UUID;

/**
 * Uuid Wrapper
 */
class Uuid
{
	static public var REGEX_V4:EReg = ~/[a-z0-9]{8}-[a-z0-9]{4}-[a-z0-9]{4}-[a-z0-9]{4}-[a-z0-9]{12}/;

	public static function isV4(s:String):Bool {
		return Uuid.REGEX_V4.match(s);
	}

	public static function v4():UuidV4 {
		var rand = new Random();
		var uuid = UUID.generateRandom(rand);
		return uuid.toString();
	}
}
