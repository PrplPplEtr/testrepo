package 
{
	import fl.controls.Button;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.system.Security;
	
	/**
	 * ...
	 * @author Christian Dewinetz
	 */
	public class Main extends Sprite 
	{
		private var tester:LEARNJavascriptTester;
		
		public function Main():void 
		{
			Security.allowDomain("*");
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			// entry point
			tester = new LEARNJavascriptTester();
			addChild(tester);
		}
		
	}
	
}