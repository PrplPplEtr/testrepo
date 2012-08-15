package  
{
	import flash.display.Sprite;
	import flash.text.TextField;
	import flash.text.TextFormat;
	import flash.events.MouseEvent;
	/**
	 * ...
	 * @author Christian Dewinetz
	 */
	public class CircleTestField extends Sprite
	{
		private var _api:CircleJavascriptAPI;
		private var _name:String;
		private var _tf_description:TextField;
		
		public function CircleTestField(name:String,api:CircleJavascriptAPI) 
		{
			_api = api;
			_name = name;
			buildField();
		}
		
		
		public function get api():CircleJavascriptAPI 
		{
			return _api;
		}
		
		public function get description_field():TextField 
		{
			return _tf_description;
		}
		
		public function set description_field(value:TextField):void 
		{
			_tf_description = value;
		}
		
		protected function sendDebugMessage(message:String):void 
		{
			api.sendDebugMessage(message);
		}
		
		public function buildField():void{}// override in subclasses
		
		public function buildDescriptionField(text:String,width:Number):void 
		{
			
			var fmt:TextFormat = new TextFormat();
			fmt.font = "Arial";
			fmt.size = 10;
			fmt.leading = -1;
			fmt.italic = true;
			fmt.color = 0x666666;
			
			description_field = new TextField();
			description_field.multiline = true;
			description_field.wordWrap = true;
			description_field.defaultTextFormat = fmt;
			description_field.width = width;
			
			description_field.text = text;
		
		}
	}

}