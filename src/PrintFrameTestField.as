package  
{
	import fl.controls.Label;
	import flash.text.TextField;
	/**
	 * ...
	 * @author Christian Dewinetz
	 */
	public class PrintFrameTestField extends CircleTestField 
	{
		private var lbl_pfr:Label;
		private var lbl_pfr2:Label;
		private var tf_response:TextField;
		
		public function PrintFrameTestField(name:String, api:CircleJavascriptAPI) 
		{
			super(name,api);
		}
		
		public override function buildField():void 
		{
			lbl_pfr = new Label();
			lbl_pfr.text = "Test Print Frame*";
			
			lbl_pfr2 = new Label();
			lbl_pfr2.text = "*No controls - Called from JS.";
			lbl_pfr2.setStyle("fontSize",8);
			lbl_pfr2.setStyle("color", 0x000000);
			lbl_pfr2.width = 200;
			
			tf_response = new TextField();
			tf_response.name = "tf_response";
			tf_response.width = 200;
			tf_response.height = 20;
			tf_response.border = true;
			tf_response.borderColor = 0x009900;
			tf_response.text = "Not yet implemented";
			
			lbl_pfr.x = 10;
			lbl_pfr.y = 5;
			
			lbl_pfr2.x = 10;
			lbl_pfr2.y = 40;
			
			tf_response.x = 10;
			tf_response.y = 20;
			
			addChild(lbl_pfr);
			addChild(lbl_pfr2);
			addChild(tf_response);
			
			
			buildDescriptionField("Add Description",260);	
			description_field.x = 220;
			description_field.y = 3;
			
			addChild(description_field);
			
			BGPainter.drawGradientBackground(this.graphics, 500, 60);
		}
		
		public function success():void 
		{
			tf_response.text = "Success!";
		}
		
	}

}