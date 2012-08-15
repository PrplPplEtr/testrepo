package  
{
	import fl.controls.Button;
	import flash.events.MouseEvent;
	import flash.text.AntiAliasType;
	import flash.text.TextField;
	import flash.text.TextFormat;
	/**
	 * ...
	 * @author Christian Dewinetz
	 */
	public class EIWrapperTestField extends CircleTestField 
	{
		private var btn_eiWrapper:Button;
		private var tf_response:TextField;
		
		
		[Embed(source="C:/WINDOWS/Fonts/WINGDING.TTF",
		fontName = "myFont",
		mimeType = "application/x-font",
		fontWeight="normal",
		fontStyle="normal",
		advancedAntiAliasing="true")]
		private var myEmbeddedFont:Class;
		
		
		public function EIWrapperTestField(name:String, api:CircleJavascriptAPI) 
		{
			super(name,api);
		}
		
		public override function buildField():void 
		{
			btn_eiWrapper = new Button();
			btn_eiWrapper.label = "Test EI Wrapper";
			btn_eiWrapper.width = 150;
			btn_eiWrapper.addEventListener(MouseEvent.CLICK, eiWrapperHandler);
			
			tf_response = new TextField();
			tf_response.name = "tf_response";
			tf_response.width = 200;
			tf_response.height = 22;
			tf_response.border = true;
			tf_response.borderColor = 0x009900;
			tf_response.embedFonts = true;
			tf_response.antiAliasType = AntiAliasType.ADVANCED;
			
			btn_eiWrapper.x = 10;
			btn_eiWrapper.y = 10;
			
			tf_response.x = 10;
			tf_response.y = 30;
			
			
			buildDescriptionField("Add Description",260);	
			description_field.x = 220;
			description_field.y = 3;
			
			addChild(btn_eiWrapper);
			addChild(tf_response);
			addChild(description_field);
			
			
			BGPainter.drawGradientBackground(this.graphics, 500, 60);
		}
		
		public function eiWrapperHandler(e:MouseEvent):void 
		{
			var char:String;
			
			var fmt:TextFormat = new TextFormat();
			fmt.font = "myFont";
			fmt.size = 18;
			
			
			if (api.isAvailable()) {
				char = "þ";// checkmark
				fmt.color = 0x006600;
			}else {
				char =  "ý";
				fmt.color = 0x660000;
			}
			tf_response.text = char;
			tf_response.setTextFormat(fmt);
		}
		
	}

}