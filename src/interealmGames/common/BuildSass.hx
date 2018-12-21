package interealmGames.common;

import interealmGames.common.fileSystem.FileSystem;
import interealmGames.common.CommandLine;

/**
 * ...
 */
class BuildSass 
{
	static function main() 
	{
		var options = CommandLine.getOptions();
		
		trace(options);
		
		var paths = FileSystem.recursiveLoop("C:/www/interealm-games/editor-frontend/browser/src/interealmGames/browser/components", "scss");
		for (path in paths) {
			trace(path);
		}
	}
}