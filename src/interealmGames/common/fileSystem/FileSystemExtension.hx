package interealmGames.common.fileSystem;

using interealmGames.common.fileSystem.FileSystemExtension; // self reference

import Sys;
import sys.FileSystem as Parent;
import haxe.io.Path;
import interealmGames.common.errors.NotImplementedOnPlatformError;

/**
 * Additional Utilities for sys.FileSystem
 * https://code.haxe.org/category/other/adding-static-methods-to-existing-classes.html
 */
class FileSystemExtension
{
	/**
	 * Recusively searches a folder for all files with a specific extension
	 * @param	cl Not used in call
	 * @param	directory Path to the search directory
	 * @param	extension The extension to search for, currently case-sensitive
	 * @return Array of all matching file paths
	 */
	static public function recursiveSearch(cl:Class<Parent>, directory:String, extension:String):Array<String> {
		var paths:Array<String> = [];
		if (sys.FileSystem.exists(directory)) {
			for (file in sys.FileSystem.readDirectory(directory)) {
				var path = haxe.io.Path.join([directory, file]);
				if (!sys.FileSystem.isDirectory(path)) {
					var pathInfo = new Path(path);
					if (pathInfo.ext == extension) {
						paths.push(path);
					}
				} else {
					var directory = haxe.io.Path.addTrailingSlash(path);
					paths = paths.concat(Parent.recursiveSearch(directory, extension));
				}
			}
		}
		
		return paths;
	}

	static public function makeSymlink(cl:Class<Parent>, source:String, symlink:String):Void {
		if (Sys.systemName() == 'Windows') {
			throw new NotImplementedOnPlatformError('Windows', 'makeSymlink');
		}

		// had issue that sh env did not know where ln was
		Sys.command('/usr/bin/ln', ['-sf', source, symlink]);
	}
}
