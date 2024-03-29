package interealmGames.common.http;

import haxe.http.HttpJs;

/**
 * ...
 */
class HttpJs extends haxe.http.HttpJs 
{

	public function new(url:String) 
	{
		super(url);
		
	}
	
	public function customRequest(post:Bool, ?method:String) {
		if (method == null) {
			method = post ? "POST" : "GET";
		}
		
		var responseData = null;
		var r = req = js.Browser.createXMLHttpRequest();
		var onreadystatechange = function(_) {
			if(r.readyState != 4)
				return;
			var s = try r.status catch(e:Dynamic) null;
			if (s != null && js.Browser.supported) {
				// If the request is local and we have data: assume a success (jQuery approach):
				var protocol = js.Browser.location.protocol.toLowerCase();
				var rlocalProtocol = ~/^(?:about|app|app-storage|.+-extension|file|res|widget):$/;
				var isLocal = rlocalProtocol.match(protocol);
				if (isLocal) {
					s = r.responseText != null ? 200:404;
				}
			}
			if(s == js.Lib.undefined)
				s = null;
			if(s != null)
				onStatus(s);
			if(s != null && s >= 200 && s < 400) {
				req = null;
				onData(responseData = r.responseText);
			}
			else if (s == null) {
				req = null;
				onError("Failed to connect or resolve host");
			}
			else switch(s) {
			case 12029:
				req = null;
				onError("Failed to connect to host");
			case 12007:
				req = null;
				onError("Unknown host");
			default:
				req = null;
				responseData = r.responseText;
				onError("Http Error #"+r.status);
			}
		};
		if(async)
			r.onreadystatechange = onreadystatechange;
		var uri = postData;
		if(uri != null)
			post = true;
		else for(p in params) {
			if(uri == null)
				uri = "";
			else
				uri += "&";
			uri += StringTools.urlEncode(p.name)+"="+StringTools.urlEncode(p.value);
		}
		try {
			if(post)
				r.open(method, url, async);
			else if(uri != null) {
				var question = url.split("?").length <= 1;
				r.open(method,url+(if(question) "?" else "&")+uri,async);
				uri = null;
			} else
				r.open(method,url,async);
		} catch(e:Dynamic) {
			req = null;
			onError(e.toString());
			return;
		}
		r.withCredentials = withCredentials;
		if(!Lambda.exists(headers, function(h) return h.name == "Content-Type") && post && postData == null)
			r.setRequestHeader("Content-Type","application/x-www-form-urlencoded");

		for(h in headers)
			r.setRequestHeader(h.name,h.value);
		r.send(uri);
		if(!async)
			onreadystatechange(null);
	}
}
