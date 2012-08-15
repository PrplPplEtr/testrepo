package  
{
	import fl.controls.DataGrid;
	import fl.controls.Label;
	import fl.controls.LabelButton;
	import fl.controls.TextInput;
	import flash.display.Graphics;
	import flash.display.Sprite;
	import fl.controls.Button;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.filters.DropShadowFilter;
	import flash.text.AntiAliasType;
	import flash.text.Font;
	import flash.text.TextField;
	import flash.text.TextFormat;
	/**
	 * ...
	 * @author Christian Dewinetz
	 */
	public class LEARNJavascriptTester extends Sprite
	{
		
		private var testField_TRANSCRIPT:CircleTestField;
		private var testField_TITLE:CircleTestField;
		private var testField_RESOURCES:CircleTestField;
		private var testField_SET_TOOL_LABEL:CircleTestField;
		private var testField_EI_WRAPPER:CircleTestField;
		
		private var testField_PRINT_FRAME:CircleTestField;
		
		private var testField_SAVE_NOTES:Sprite;
		private var testField_START_CLIP:Sprite;
		
		
		private var api:CircleJavascriptAPI;
		
		public function LEARNJavascriptTester() 
		{
			var externalCallbacks:Array = new Array();
			externalCallbacks.push(new ExternalInterfaceCallbackVO("printFrame",printFrame));
			externalCallbacks.push(new ExternalInterfaceCallbackVO("startClip",startClip));
			//externalCallbacks.push(new ExternalInterfaceCallbackVO("saveNotes",saveNotes));
			
			api = new CircleJavascriptAPI(externalCallbacks);
			
			api.addEventListener("externalAPI", eiReady);
			
			draw();
		}
		
		private function eiReady(e:Event):void 
		{
			
			var jsCall:JavascriptCallVO = new JavascriptCallVO();
			jsCall.method = CircleJavascriptAPI.SET_TOOL_LABEL;
			
			jsCall.data = {label:"Transcript",target:"transcript"};
			api.callMethod(jsCall);
			
			jsCall.data = {label:"User Notes",target:"notepad"};
			api.callMethod(jsCall);
			
			jsCall.data = {label:"Resources",target:"resources"};
			api.callMethod(jsCall);
			
			jsCall.data = {label:"Print-friendly",target:"print_friendly"};
			api.callMethod(jsCall);
			
			jsCall.data = {label:"Print Frame",target:"print_frame"};
			api.callMethod(jsCall);
		}
		
		private function draw():void 
		{
			buildComponents();
			layoutComponents();
		}
		
		private function layoutComponents():void 
		{
			var shadow:DropShadowFilter = new DropShadowFilter(); 
			shadow.distance = 2; 
			shadow.angle = 25; 
			shadow.blurX = 5;
			shadow.blurY = 5;
			shadow.strength = .5;
			

			testField_RESOURCES.x = 10;
			testField_RESOURCES.y = 10;
			testField_RESOURCES.filters = [shadow];
			addChild(testField_RESOURCES);
			
			testField_TITLE.x = 10;
			testField_TITLE.y = 150;
			testField_TITLE.filters = [shadow];
			addChild(testField_TITLE);
			
			testField_TRANSCRIPT.x = 10;
			testField_TRANSCRIPT.y = 220;
			testField_TRANSCRIPT.filters = [shadow];
			addChild(testField_TRANSCRIPT);
			
			testField_SET_TOOL_LABEL.x = 10;
			testField_SET_TOOL_LABEL.y = 290;
			testField_SET_TOOL_LABEL.filters = [shadow];
			addChild(testField_SET_TOOL_LABEL);
			
			testField_EI_WRAPPER.x = 10;
			testField_EI_WRAPPER.y = 430;
			testField_EI_WRAPPER.filters = [shadow];
			addChild(testField_EI_WRAPPER);
			
			testField_PRINT_FRAME.x = 10;
			testField_PRINT_FRAME.y = 500;
			testField_PRINT_FRAME.filters = [shadow];
			addChild(testField_PRINT_FRAME);
			
			
			testField_START_CLIP.x = 10;
			testField_START_CLIP.y = 570;
			testField_START_CLIP.filters = [shadow];
			addChild(testField_START_CLIP);
		}
		
		private function buildComponents():void 
		{
			// OUTGOING
			testField_TRANSCRIPT=new TranscriptTestField("testField_TRANSCRIPT",api) as CircleTestField;
			testField_TITLE = new TitleTestField("testField_TITLE", api) as CircleTestField;
			testField_RESOURCES=new ResourcesTestField("testField_RESOURCES",api) as CircleTestField;
			testField_SET_TOOL_LABEL=new ToolLabelTestField("testField_SET_TOOL_LABEL",api) as CircleTestField;
			testField_EI_WRAPPER = new EIWrapperTestField("testField_EI_WRAPPER", api) as CircleTestField;
			
			
			testField_PRINT_FRAME=new PrintFrameTestField("testField_EI_WRAPPER",api) as CircleTestField;
			testField_START_CLIP=new StartClipTestField("testField_START_CLIP",api) as CircleTestField;

		}
		
		
		public function printFrame():void {
			api.sendDebugMessage("JS requests printFrame");
			PrintFrameTestField(testField_PRINT_FRAME).success();
		}
		
		public function startClip():void {
			api.sendDebugMessage("JS requests startClip");
			StartClipTestField(testField_START_CLIP).success();
		}
		
		
		
	}

}