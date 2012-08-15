/**
 * ...
 * @author Christian Dewinetz
 */

var DOM_UTIL={
			
	setNavTitle:function(str){
		$("#circle_navigation > #link_title").html(str);
	},
	
	clearNavTitle:function(){
		DOM_UTIL.setNavTitle("");
	},
	
	toolButtonOver:function(event){
		var type=event.data.type;
		var target=event.data.target;
		
		// get and set label
		var label=LEARN_API.getAssignedToolLabel(type);
		DOM_UTIL.showToolLabel(label);
		
		// do hover effect
		$(target).css('backgroundPosition', '0px -50px');
	},
	
	toolButtonOut:function(event){
		var target=event.data.target;
		$(target).css('backgroundPosition', '0px 0px');
		DOM_UTIL.hideToolLabel();
	},
	
	showToolLabel:function(label){
		$(".circle_tool#label").html(label);
	},
	
	hideToolLabel:function(){
		$(".circle_tool#label").html("&nbsp;");
	},
	
	setToolLabels:function(type,label){
		var selOne=".circle_container > #"+type+"_label";
		var selTwo="#btn_"+type;
		$(selOne).html(label);
		$(selTwo).html(label);
	}
	
	printFriendly:function(){
		var pfLink=LEARNURLParser.getPathToPrintFriendly();
		window.open(pfLink,'_blank');
	},
	
	toggleContainer:function(event){
		var target=event.data.target;
		DOM_UTIL.closeOpenContainers();
		$(target)
			.slideToggle(500)
			.addClass("container_open");
	},
	
	closeContainer:function(){
		DOM_UTIL.closeOpenContainers();
	},
	
	closeOpenContainers:function(){
		$(".container_open")
			.slideUp(500)
			.removeClass("container_open");
	},
	
	flashNext:function(){
		var img_url="url('"+LEARNURLParser.SHARED_DIRECTORY+"images/nextbarber.gif')";
		$("#circle_navigation > #next_link").css("background-image", img_url);
	},// END: flashNext
};
