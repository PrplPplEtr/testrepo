package  
{
	import fl.controls.Label;
	import flash.text.TextField;
	/**
	 * ...
	 * @author Christian Dewinetz
	 */
	public class StartClipTestField extends CircleTestField 
	{
		private var lbl_start:Label;
		private var lbl_start2:Label;
		private var tf_response:TextField;
		
		public function StartClipTestField(name:String, api:CircleJavascriptAPI) 
		{
			super(name,api);
		}
		
		public override function buildField():void 
		{
			
			lbl_start = new Label();
			lbl_start.text = "Test StartClip*";
			
			lbl_start2 = new Label();
			lbl_start2.text = "*No controls - Called from JS.";
			lbl_start2.setStyle("fontSize",8);
			lbl_start2.setStyle("color", 0x000000);
			lbl_start2.width = 200;
			
			tf_response = new TextField();
			tf_response.name = "tf_response";
			tf_response.width = 200;
			tf_response.height = 18;
			tf_response.border = true;
			tf_response.borderColor = 0x009900;
			tf_response.text = "Not yet implemented";
			
			lbl_start.x = 10;
			lbl_start.y = 5;
			
			lbl_start2.x = 10;
			lbl_start2.y = 40;
			
			tf_response.x = 10;
			tf_response.y = 20;
			
			
			buildDescriptionField("Add Description",260);	
			description_field.x = 220;
			description_field.y = 3;
			
			addChild(lbl_start);
			addChild(lbl_start2);
			addChild(tf_response);
			addChild(description_field);
			
			BGPainter.drawGradientBackground(this.graphics,500,60);
			
		}
		
		public function success():void 
		{
			tf_response.text = "Success!";
		}
		
	}

}