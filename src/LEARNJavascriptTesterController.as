package  
{
	import com.circlelearning.learn.v7.model.LMSJavascriptAPI;
	import fl.controls.TextInput;
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.text.TextField;
	import flash.text.TextFormat;
	/**
	 * ...
	 * @author Christian Dewinetz
	 */
	public class LEARNJavascriptTesterController 
	{
		private var ui:LEARNJavascriptTester;
		private var api:CircleJavascriptAPI;
		
		[Embed(source="C:/WINDOWS/Fonts/WINGDING.TTF",
		fontName = "myFont",
		mimeType = "application/x-font",
		fontWeight="normal",
		fontStyle="normal",
		advancedAntiAliasing="true")]
		private var myEmbeddedFont:Class;
		
		public function LEARNJavascriptTesterController(target:LEARNJavascriptTester) 
		{
			ui = target;
			//api = new CircleJavascriptAPI();
			api = null;
		}
		
		
		
		
		public function setTitleHandler(e:MouseEvent):void 
		{
			var field:Sprite = ui.getTestField("TITLE");
			var title:String = TextInput(field.getChildByName("ti_title")).text;
			if (title=="") {
				throw new Error("Title cannot be empty");
			}
			trace("setTitleHandler:" + title);
			
			//api.setActivityTitle(title);
			var jsCall:JavascriptCallVO = new JavascriptCallVO();
			jsCall.method = CircleJavascriptAPI.SET_ACTIVITY_TITLE;
			jsCall.data = title;
			api.callMethod(jsCall);
		}
		
		
		
		
		public function setResourcesHandler(e:MouseEvent):void 
		{
			var field:Sprite = ui.getTestField("RESOURCES");
			var label:String = TextInput(field.getChildByName("ti_resLabel")).text;
			var url:String = TextInput(field.getChildByName("ti_resURL")).text;
			if (label=="") {
				trace("label cannot be empty");
			}
			if (url=="") {
				trace("url cannot be empty");
			}
			trace("setResourcesHandler:" + label + "::" + url);
			
			var jsCall:JavascriptCallVO = new JavascriptCallVO();
			jsCall.method = CircleJavascriptAPI.SET_EXTERNAL_RESOURCES_CONTENT;
			jsCall.data = [{label:label,url:url,description:"beluga"}];
			api.callMethod(jsCall);
		}
		
		
		
		
		public function setToolLabelHandler(e:MouseEvent):void 
		{
			var field:Sprite = ui.getTestField("SET_TOOL_LABEL");
			var label:String = TextInput(field.getChildByName("ti_toolLabel")).text;
			var target:String = TextInput(field.getChildByName("ti_targTool")).text;
			if (label=="") {
				trace("label cannot be empty");
			}
			if (target=="") {
				trace("target cannot be empty");
			}
			trace("setToolLabelHandler:" + label + "::" + target);
			
			var jsCall:JavascriptCallVO = new JavascriptCallVO();
			jsCall.method = CircleJavascriptAPI.SET_TOOL_LABEL;
			jsCall.data = {label:label,target:target};
			api.callMethod(jsCall);
		}
		
		
		
		
		public function eiWrapperHandler(e:MouseEvent):void 
		{
			var field:Sprite = ui.getTestField("EI_WRAPPER");
			trace("eiWrapperHandler");
			var tf:TextField = field.getChildByName("tf_response") as TextField;
			var bool:Boolean = api.isAvailable();
			var char:String = "ý";// x-mark
			var fmt:TextFormat = new TextFormat();
			fmt.font = "myFont";
			fmt.size = 18;
			
			fmt.color = 0x660000;
			if (bool==true) {
				char = "þ";// checkmark
				fmt.color = 0x006600;
			}
			tf.text = char;
			tf.setTextFormat(fmt);
		}
		
		
		
		private function getTestField(str:String):Sprite 
		{
			return this.ui.getTestField(str);
		}
	}

}