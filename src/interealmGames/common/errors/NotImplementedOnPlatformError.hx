package interealmGames.common.errors;

class NotImplementedOnPlatformError extends Error {
	static public var TYPE = "NOT_IMPLEMENTED_ON_PLATFORM";

	public function new(platform:String, featureName:String) {
		super(
			NotImplementedOnPlatformError.TYPE,
			'"$featureName" no implemented for platform "$platform"'
		);
	}
}
