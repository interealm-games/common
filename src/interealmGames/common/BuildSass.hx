package interealmGames.common;

import interealmGames.common.fileSystem.FileSystemExtension;
import interealmGames.common.commandLine.CommandLine;

/**
 * ...
 */
class BuildSass 
{
	static function main() 
	{
		var options = CommandLine.getOptions();
		
		trace(options);
		
		var paths = FileSystemExtension.recursiveLoop("C:/www/interealm-games/editor-frontend/browser/src/interealmGames/browser/components", "scss");
		for (path in paths) {
			trace(path);
		}
	}
}