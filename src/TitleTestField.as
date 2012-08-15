package  
{
	import fl.controls.Button;
	import fl.controls.TextInput;
	import flash.events.MouseEvent;
	/**
	 * ...
	 * @author Christian Dewinetz
	 */
	public class TitleTestField extends CircleTestField 
	{
		
		private var btn_setActivityTitle:Button;
		private var ti_title:TextInput;
		
		public function TitleTestField(name:String, api:CircleJavascriptAPI) 
		{
			super(name,api);
		}
		
		public override function buildField():void 
		{
			
			btn_setActivityTitle = new Button();
			btn_setActivityTitle.label = "Set Activity Title";
			btn_setActivityTitle.name = "btn_setActivityTitle";
			btn_setActivityTitle.addEventListener(MouseEvent.CLICK, setTitleHandler);
			
			ti_title = new TextInput();
			ti_title.name = "ti_title";
			ti_title.width = 200;
			
			
			btn_setActivityTitle.y = 10;
			ti_title.y = 30;
			btn_setActivityTitle.x = 10;
			ti_title.x = 10;
			
			buildDescriptionField("We may need to display the Activity title.  Use this field to test the JS method to set the title on the page.  Enter some title text and click 'Set Title'",260);	
			description_field.x = 220;
			description_field.y = 3;
			
			addChild(btn_setActivityTitle);
			addChild(ti_title);
			addChild(description_field);
			
			BGPainter.drawGradientBackground(this.graphics,500,60);
		}
		
		private function setTitleHandler(e:MouseEvent):void 
		{
			var title:String = ti_title.text;
			
			if (title=="") {
				trace("title cannot be empty");
				sendDebugMessage("Cannot set Title content: title cannot be empty");
			}
			
			testJSMethod(title);
		}
		
		private function testJSMethod(title:String):void 
		{
			var jsCall:JavascriptCallVO = new JavascriptCallVO();
			jsCall.method = CircleJavascriptAPI.SET_ACTIVITY_TITLE;
			jsCall.data = title;
			api.callMethod(jsCall);
		}
		
	}

}