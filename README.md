# common

Common Haxe utilities and libraries for all Interealm Games projects, 

## Use

### License
This repository is free for use under the [MIT License](https://github.com/interealm-games/common/blob/master/LICENSE). Other Interealm Games repositories may or may not be under the same license.  This library specifically attempts to be general utilities that would be useful to any Haxe project, so we welcome you to make use of it and give u

### Dependencies

The interealmGames.common.Uuid class relies on the [haxe-crypto](https://github.com/soywiz/haxe-crypto) library which can be installed with 
	
```
haxelib install haxe-crypto
```

## Contents

The library currently provides utility functions for Arrays, Maps/Dictionaries, the command line and the file system.

## Notes

Interealm Games code often aliases [Map](https://api.haxe.org/Map.html) as Dictionary, just FYI. Thus, interealmGames.common.dictionary.DictionaryTools is for use with Map.

## Testing

```
haxe -lib haxe-crytpo -cp src -main interealmGames.common.Test --interp
```

