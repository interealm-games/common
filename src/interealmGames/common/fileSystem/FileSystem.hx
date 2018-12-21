package interealmGames.common.fileSystem;

import sys.FileSystem as Parent;
import haxe.io.Path;
/**
 * ...
 * @author ...
 */
class FileSystem extends Parent
{
	static public function recursiveLoop(directory:String, extension:String):Array<String> {
		var paths:Array<String> = [];
		if (sys.FileSystem.exists(directory)) {
			//trace("directory found: " + directory);
			
			for (file in sys.FileSystem.readDirectory(directory)) {
				var path = haxe.io.Path.join([directory, file]);
				if (!sys.FileSystem.isDirectory(path)) {
					var pathInfo = new Path(path);
					if (pathInfo.ext == extension) {
						//trace("file found: " + path);
						paths.push(path);
					}
					//trace("file found: " + path);
					//trace("extension: " + pathInfo.ext);
					// do something with file
				} else {
					var directory = haxe.io.Path.addTrailingSlash(path);
					//trace("directory found: " + directory);
					paths = paths.concat(recursiveLoop(directory, extension));
				}
			}
		} else {
			//trace('"$directory" does not exists');
		}
		
		return paths;
	}
}