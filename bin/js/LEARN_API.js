/**
 * 
 */
var LEARN_API={
		CONSTANTS:{
			LBL_TRANSCRIPT:"XXTranscript",
			LBL_NOTEPAD:"XXUser Notes",
			LBL_PRINT_FRIENDLY:"XXPrint-friendly",
			LBL_PRINT_FRAME:"XXPrint Frame",
			LBL_RESOURCES:"XXExternal Resources",
			CIRCLE_NEXT_TITLE:"Next",
			CIRCLE_PREVIOUS_TITLE:"Prev",
			CIRCLE_NEXT_URL:"http://www.cnn.com",
			CIRCLE_PREVIOUS_URL:"http://www.twitter.com",
		},
		callInit:function(){
			LEARNControlMapping.mapElementsToControls();
			AS_TO_JS_API.messageFromAS("Loading Media");
		},
		goURLHandler:function(event){
			window.location=event.data.url;
		},
		setNavTitleHandler:function(event){
			var direction=event.data.direction;
			var title=LEARN_API.getAssignedNavTitle(direction);
			DOM_UTIL.setNavTitle(title);
		},
		clearNavTitleHandler:function(){
			DOM_UTIL.clearNavTitle();
		},
		toolButtonOver:function(event){
			DOM_UTIL.toolButtonOver(event);
		},
		toolButtonOut:function(event){
			DOM_UTIL.toolButtonOut(event);
		},
		toggleContainer:function(event){
			DOM_UTIL.toggleContainer(event);
		},
		closeContainer:function(event){
			DOM_UTIL.closeContainer(event);
		},
		flashNext:function(){
			DOM_UTIL.flashNext();
		},
		printFriendly:function(){
			DOM_UTIL.printFriendly();
		},
		startClip:function(){
			JS_TO_AS_API.startClip();
		},
		printFrame:function(){
			JS_TO_AS_API.printFrame();
		},
		getAssignedToolLabel:function(type){
			switch(type){
				case "transcript":
					return LEARN_API.CONSTANTS.LBL_TRANSCRIPT;
				case "notepad":
					return LEARN_API.CONSTANTS.LBL_NOTEPAD;
				case "print_friendly":
					return LEARN_API.CONSTANTS.LBL_PRINT_FRIENDLY;
				case "print_frame":
					return LEARN_API.CONSTANTS.LBL_PRINT_FRAME;
				case "resources":
					return LEARN_API.CONSTANTS.LBL_RESOURCES;
				default:
					//alert("Invalid tool type: "+type);
					return "INVALID";
					
			}
		},
		getAssignedNavTitle:function(direction){
			switch(direction){
				case "next":
					return LEARN_API.CONSTANTS.CIRCLE_NEXT_TITLE;
				case "previous":
					return LEARN_API.CONSTANTS.CIRCLE_PREVIOUS_TITLE;
				default:
					alert("Invaliud navigation direction: "+direction);
			}
		},
};





$(document).ready(LEARN_API.callInit);

