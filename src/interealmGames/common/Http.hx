package interealmGames.common;

#if sys
typedef Http = sys.Http;
#elseif nodejs
typedef Http = haxe.http.HttpNodeJs;
#elseif js
typedef Http = interealmGames.common.http.HttpJs;
#else
typedef Http = haxe.http.HttpBase;
#end