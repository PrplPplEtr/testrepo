package  
{
	import fl.controls.Button;
	import fl.controls.Label;
	import fl.controls.TextInput;
	import flash.events.MouseEvent;
	/**
	 * ...
	 * @author Christian Dewinetz
	 */
	public class ToolLabelTestField extends CircleTestField 
	{
		private var btn_setToolLabel:Button;
		private var lbl_toolLabel:Label;
		private var ti_toolLabel:TextInput;
		private var lbl_targTool:Label;
		private var ti_targTool:TextInput;
		
		public function ToolLabelTestField(name:String, api:CircleJavascriptAPI) 
		{
			super(name,api);
		}
		
		public override function buildField():void 
		{
			
			btn_setToolLabel = new Button();
			btn_setToolLabel.label = "Set Tool Label";
			btn_setToolLabel.name = "btn_setToolLabel";
			btn_setToolLabel.width = 150;
			btn_setToolLabel.addEventListener(MouseEvent.CLICK, setToolLabelHandler);
			
			lbl_toolLabel = new Label();
			lbl_toolLabel.text = "Tool Label";
			
			ti_toolLabel = new TextInput();
			ti_toolLabel.name = "ti_toolLabel"; 
			ti_toolLabel.width = 200; 
			
			lbl_targTool = new Label();
			lbl_targTool.text = "Target Tool";
			
			ti_targTool = new TextInput();
			ti_targTool.name = "ti_targTool"; 
			ti_targTool.width = 200; 
			
			btn_setToolLabel.y = 10;
			lbl_toolLabel.y = 35;
			ti_toolLabel.y = 50;
			lbl_targTool.y = 85;
			ti_targTool.y = 100;
			
			btn_setToolLabel.x = 10;
			lbl_toolLabel.x = 10;
			ti_toolLabel.x = 10;
			lbl_targTool.x = 10;
			ti_targTool.x = 10;
			
			buildDescriptionField("Add Description",260);	
			description_field.x = 220;
			description_field.y = 3;
			
			addChild(btn_setToolLabel);
			addChild(lbl_toolLabel);
			addChild(ti_toolLabel);
			addChild(lbl_targTool);
			addChild(ti_targTool);
			addChild(description_field);
			
			BGPainter.drawGradientBackground(this.graphics,500,130);
		}
		
		private function setToolLabelHandler(e:MouseEvent):void 
		{
			var label:String = ti_toolLabel.text;
			var target:String = ti_targTool.text;
			if (label=="") {
				sendDebugMessage("Cannot set Tool Label: label cannot be empty");
			}
			if (target=="") {
				sendDebugMessage("Cannot set Tool Label: target cannot be empty");
			}
			
			testJSMethod(label,target);
		}
		
		private function testJSMethod(label:String,target:String):void 
		{
			
			var jsCall:JavascriptCallVO = new JavascriptCallVO();
			jsCall.method = CircleJavascriptAPI.SET_TOOL_LABEL;
			jsCall.data = {label:label,target:target};
			api.callMethod(jsCall);
		}
	}

}