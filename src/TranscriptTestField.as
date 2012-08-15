package  
{
	import fl.controls.Button;
	import fl.controls.TextInput;
	import flash.display.Graphics;
	import flash.events.MouseEvent;
	/**
	 * ...
	 * @author Christian Dewinetz
	 */
	public class TranscriptTestField extends CircleTestField 
	{
		private var btn_setTranscript:Button;
		private var ti_transcript:TextInput;
		
		
		public function TranscriptTestField(name:String,api:CircleJavascriptAPI) 
		{
			super(name,api);
		}
		
		
		
		
		public override function buildField():void 
		{
			btn_setTranscript = new Button();
			btn_setTranscript.label = "Set Transcript";
			btn_setTranscript.addEventListener(MouseEvent.CLICK, this.setTranscriptHandler);
			
			ti_transcript = new TextInput();
			ti_transcript.width = 200;
			
			btn_setTranscript.y = 10;
			ti_transcript.y = 30;
			btn_setTranscript.x = 10;
			ti_transcript.x = 10;
			
			buildDescriptionField("Use this field to test setting the transcript content from the SWF.  Enter some text in the field and click the 'Set Transcript' button.  The entered text should then be available in the html page.",260);	
			description_field.x = 220;
			description_field.y = 3;
			
			addChild(btn_setTranscript);
			addChild(ti_transcript);
			addChild(description_field);
			
			BGPainter.drawGradientBackground(this.graphics, 500, 60);
		}
		
		private function setTranscriptHandler(e:MouseEvent):void 
		{
			var transcript:String = ti_transcript.text;
			
			if (transcript=="") {
				trace("transcript cannot be empty");
				sendDebugMessage("Cannot set Transcript content: transcript cannot be empty");
			}
			
			testJSMethod(transcript);
		}
		
		private function testJSMethod(transcript:String):void 
		{
			var jsCall:JavascriptCallVO = new JavascriptCallVO();
			jsCall.method = CircleJavascriptAPI.SET_TRANSCRIPT_CONTENT;
			jsCall.data = transcript;
			api.callMethod(jsCall);
		}
		
		
		
	}

}