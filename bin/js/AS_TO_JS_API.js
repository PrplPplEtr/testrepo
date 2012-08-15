/**
 * ...
 * @author Christian Dewinetz
 
 The functions defined herein - in the top namespace (AS_TO_JS_API) - are callable from the SWF
 */

var AS_TO_JS_API={
	CONSTANTS:{
		TRANSCRIPT:"transcript",
		NOTEPAD:"notepad",
		PRINT_FRIENDLY:"print_friendly",
		PRINT_FRAME:"print_frame",
		RESOURCES:"resources"
	},
	
	isAvailable:function(){
		return "true";
	},
	
	setActivityTitle:function(str){
		$("#activity_title").html(str);
	},
	
	setTranscriptContent:function(txt){
		$("#transcript_contents").html(txt);
	},
	
	
	setExternalResourcesContent:function(arr){
		var html=AS_TO_JS_API.PRIVATE.buildResourcesHTML(arr);
		$("#resources_contents").html(html);
	},
	
	setToolLabel:function(vo){
		var target=vo.target;
		var label=vo.label;
		
		switch(target){
			case AS_TO_JS_API.CONSTANTS.TRANSCRIPT:
				LEARN_API.CONSTANTS.LBL_TRANSCRIPT=label;
				DOM_UTIL.setToolLabels("transcript",label);
				break;
			case AS_TO_JS_API.CONSTANTS.NOTEPAD:
				LEARN_API.CONSTANTS.LBL_NOTEPAD=label;
				DOM_UTIL.setToolLabels("notepad",label);
				break;
			case AS_TO_JS_API.CONSTANTS.PRINT_FRIENDLY:
				LEARN_API.CONSTANTS.LBL_PRINT_FRIENDLY=label;
				DOM_UTIL.setToolLabels("print_friendly",label);
				break;
			case AS_TO_JS_API.CONSTANTS.PRINT_FRAME:
				LEARN_API.CONSTANTS.LBL_PRINT_FRAME=label;
				DOM_UTIL.setToolLabels("print_frame",label);
				break;
			case AS_TO_JS_API.CONSTANTS.RESOURCES:
				LEARN_API.CONSTANTS.LBL_RESOURCES=label;
				DOM_UTIL.setToolLabels("resources",label);
				break;
			default:
				alert("Target ("+target+") not found");
		}
	},
	
	debug:function(str){
		$("#debug").append(str+"<br/>");
	},
	
	
	messageFromAS:function(txt){
		var str=txt+'<br/>';
		if($("#circle_load_message").is(":visible")){
			var str=txt+'<br/>';
			$("#circle_load_message").append(str);
		}else if($("#debug").is(":visible")){
			var str=txt+'<br/>';
			$("#debug").append(str);
		}else{
			alert(txt);
		}
	},// END: messageFromAS
	
	
	swfReady:function(){
		$("#circle_load_gfx").toggle();
		$("#circle_load_message").toggle();
		$("#circle_load_ellipsis").toggle();
		$("#circle_gui_modal").fadeOut(1000,JS_TO_AS_API.startClip);
	},// END: swfReady
	
	PRIVATE:{
		buildResourcesHTML:function(arr){
			var html='';
			var len=arr.length;
			for(var i=0;i<len;i++){
				var item=arr[i];
				var link='<a href="'+item['url']+'" title="'+item['label']+'" target="_blank">'+item['label']+'</a>';
				var desc='<div class="circle_resource_description">'+item['description']+'</div>';
				var wrapped='<p>'+link+desc+'</p>';
				html+=wrapped;
			}
			return html;
		}
	},
};