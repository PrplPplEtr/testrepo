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
	public class ResourcesTestField extends CircleTestField 
	{
		private var btn_setResources:Button;
		private var lbl_resLabel:Label;
		private var ti_resLabel:TextInput;
		private var lbl_resPath:Label;
		private var ti_resURL:TextInput;
		private var lbl_resDesc:Label;
		private var ti_resDesc:TextInput;
		
		public function ResourcesTestField(name:String, api:CircleJavascriptAPI) 
		{
			super(name,api);
		}
		
		public override function buildField():void 
		{
			
			btn_setResources = new Button();
			btn_setResources.label = "Set External Resource";
			btn_setResources.width = 150;
			btn_setResources.addEventListener(MouseEvent.CLICK, setResourcesHandler);
			
			lbl_resLabel = new Label();
			lbl_resLabel.text = "Resource Label";
			
			ti_resLabel = new TextInput();
			ti_resLabel.name = "ti_resLabel"; 
			ti_resLabel.width = 150; 
			
			lbl_resPath = new Label();
			lbl_resPath.text = "Resource Path";
			
			ti_resURL = new TextInput();
			ti_resURL.name = "ti_resURL"; 
			ti_resURL.width = 200; 
			
			lbl_resDesc = new Label();
			lbl_resDesc.text = "Resource Description/Alt-text";
			lbl_resDesc.width = 250;
			
			ti_resDesc = new TextInput();
			ti_resDesc.width = 250; 
			
			btn_setResources.y = 10;
			lbl_resLabel.y = 35;
			ti_resLabel.y = 50;
			lbl_resPath.y = 85;
			ti_resURL.y = 100;
			
			lbl_resDesc.x = 220;
			lbl_resDesc.y = 85;
			ti_resDesc.x = 220;
			ti_resDesc.y = 100;
			
			
			btn_setResources.x = 10;
			lbl_resLabel.x = 10;
			ti_resLabel.x = 10;
			lbl_resPath.x = 10;
			ti_resURL.x = 10;
			
			
			buildDescriptionField("Enter both a label and a path value and click 'Set Resource' to test the display of External Resources.",310);	
			description_field.x = 170;
			description_field.y = 3;
			
			addChild(btn_setResources);
			addChild(lbl_resLabel);
			addChild(ti_resLabel);
			addChild(lbl_resPath);
			addChild(ti_resURL);
			addChild(lbl_resDesc);
			addChild(ti_resDesc);
			addChild(description_field);
			
			BGPainter.drawGradientBackground(this.graphics, 500, 130);
		}
		
		private function setResourcesHandler(e:MouseEvent):void 
		{
			var label:String = ti_resLabel.text;
			var url:String = ti_resURL.text;
			var description:String = ti_resDesc.text;
			if (label=="") {
				sendDebugMessage("Cannot set Resource content: label cannot be empty");
			}
			if (url=="") {
				sendDebugMessage("Cannot set Resource content: url cannot be empty");
			}
			
			testJSMethod(label,url,description);
		}
		
		private function testJSMethod(label:String,url:String,description:String="beluga"):void 
		{
			var jsCall:JavascriptCallVO = new JavascriptCallVO();
			jsCall.method = CircleJavascriptAPI.SET_EXTERNAL_RESOURCES_CONTENT;
			jsCall.data = [{label:label,url:url,description:description}];
			api.callMethod(jsCall);
		}
		
	}

}