/**
 * ...
 * @author Christian Dewinetz
 
 We need to assign our controls to the page elements.  This does that.  ...and ONLY that.
 */

var LEARNControlMapping={
	mapElementsToControls:function(){
		
		// NAVIGATION (NEXT/PREV)
		$("#circle_navigation > #next_link")
			.on("click",{url:LEARN_API.CONSTANTS.CIRCLE_NEXT_URL},LEARN_API.goURLHandler)
			.on("mouseover",{direction:"next"},LEARN_API.setNavTitleHandler)
			.on("mouseout",{title:""},LEARN_API.clearNavTitleHandler);
			
		$("#circle_navigation > #previous_link")
			.on("click",{url:LEARN_API.CONSTANTS.CIRCLE_PREVIOUS_URL},LEARN_API.goURLHandler)
			.on("mouseover",{direction:"previous"},LEARN_API.setNavTitleHandler)
			.on("mouseout",LEARN_API.clearNavTitleHandler);
			
			
		// TOOLS
		$("#btn_print_friendly")
			.on("click",LEARN_API.printFriendly)
			.on("mouseover",{type:"print_friendly",target:this},LEARN_API.toolButtonOver)
			.on("mouseout",{target:this},LEARN_API.toolButtonOut);
			
		$("#btn_print_frame")
			.on("click",LEARN_API.printFrame)
			.on("mouseover",{type:"print_frame",target:this},LEARN_API.toolButtonOver)
			.on("mouseout",{target:this},LEARN_API.toolButtonOut);
			
		$("#btn_start_clip")
			.on("click",LEARN_API.startClip)
			.on("mouseover",{type:"start_clip",target:this},LEARN_API.toolButtonOver)
			.on("mouseout",{target:this},LEARN_API.toolButtonOut);
			
		$("#btn_transcript")
			.on("click",{target:"#transcript_container"},LEARN_API.toggleContainer)
			.on("mouseover",{type:"transcript",target:this},LEARN_API.toolButtonOver)
			.on("mouseout",{target:this},LEARN_API.toolButtonOut);
			
		$("#btn_resources")
			.on("click",{target:"#resources_container"},LEARN_API.toggleContainer)
			.on("mouseover",{type:"resources",target:this},LEARN_API.toolButtonOver)
			.on("mouseout",{target:this},LEARN_API.toolButtonOut);
			
		$("#btn_notepad")
			.on("click",{target:"#notepad_container"},LEARN_API.toggleContainer)
			.on("mouseover",{type:"notepad",target:this},LEARN_API.toolButtonOver)
			.on("mouseout",{target:this},LEARN_API.toolButtonOut);
			
		$('#transcript_container > input[value="Close"],#notepad_container > input[value="Close"],#resources_container > input[value="Close"]')
			.on("click",LEARN_API.closeContainer);
			
	},
}
