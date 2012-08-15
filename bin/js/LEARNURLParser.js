/**
 * ...
 * @author Christian Dewinetz
 */

var LEARNURLParser={
	ASSET_DIRECTORY:"",
	SHARED_DIRECTORY:"",
	PATH_TO_SWF:"",
	PRINT_FRIENDLY_LINK:"",
	getExtractDir:function(){
		var path=window.location.pathname;
		var elements=path.split("/");
		var page=elements.pop();
		var shared=elements.join("/");
		var dir=elements.pop();
		var loc=elements.join("/");
		loc+="/";
		return loc;
	},
	getPathToSharedDirectory:function(){
		var extract=LEARNURLParser.getExtractDir();
		var shared=extract+"shared/";
		return shared;
	},
	getPathToAssetDirectory:function(){
		var queryElements =LEARNURLParser.getParsedQuery();
		var pathToAssets="";
		for (var i=0; i<queryElements.length; i++){
			elements=queryElements[i].split("=");// [["folder","blah"],["swf","bleet"]]
			if(elements[0]=='media'){
				var media=elements[1].split("/");
				var folder=media[0];
				//var file=media[1];
				//var swf=media[1]+".swf";
				pathToAssets=LEARNURLParser.getExtractDir()+folder+"/";
				
			}
	
		}
		return pathToAssets;
	},
	getPathToPrintFriendly:function(){
		var pathToPrintFriendly=LEARNURLParser.getPathToAssetDirectory()+"activity_data.xml";
		return pathToPrintFriendly;
	},
	getPathToSWF:function(){
		var queryElements =LEARNURLParser.getParsedQuery();
		var pathToSWF="";
		for (var i=0; i<queryElements.length; i++){
			elements=queryElements[i].split("=");// [["folder","blah"],["swf","bleet"]]
			if(elements[0]=='media'){
				var media=elements[1].split("/");
				var folder=media[0];
				var file=media[1];
				//var swf=media[1]+".swf";
				pathToSWF="../"+folder+"/"+file;
				
			}
	
		}
		return pathToSWF;
	},
	getParsedQuery:function(){
		var queryString = new String(document.location.search);// "?folder=blah&swf=bleet"// ?media=folder/filenoextension&description=kjhkljhklj
		queryString = queryString.replace("?", "");// "folder=blah&swf=bleet"// media=folder/filenoextension&description=kjhkljhklj
		var queryElements = queryString.split("&");// ["folder=blah","swf=bleet"]// [media=folder/filenoextension,description=kjhkljhklj]
		return queryElements;//array
	}
}

LEARNURLParser.ASSET_DIRECTORY=LEARNURLParser.getPathToAssetDirectory();
LEARNURLParser.SHARED_DIRECTORY=LEARNURLParser.getPathToSharedDirectory();
LEARNURLParser.PATH_TO_SWF=LEARNURLParser.getPathToSWF();
LEARNURLParser.PRINT_FRIENDLY_LINK=LEARNURLParser.getPathToPrintFriendly();
