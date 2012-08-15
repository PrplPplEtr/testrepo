package  
{
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.events.TimerEvent;
	import flash.external.ExternalInterface;
	import flash.utils.Timer;
	/**
	 * ...
	 * @author Christian Dewinetz
	 */
	public class CircleJavascriptAPI extends EventDispatcher
	{
		static private const JS_OBJECT_NAME:String = "AS_TO_JS_API.";
		private var timer:Timer;
		private var _externalCallbacks:Array;
		private var circleWrapperAvailable:Boolean=false;
		
		static public const SET_ACTIVITY_TITLE:String = "setActivityTitle";
		static public const SET_TRANSCRIPT_CONTENT:String = "setTranscriptContent";
		static public const SET_EXTERNAL_RESOURCES_CONTENT:String = "setExternalResourcesContent";
		static public const SET_TOOL_LABEL:String = "setToolLabel";
		static public const DEBUG:String = "debug";
		static public const MESSAGE_FROM_AS:String = "messageFromAS";
		static public const IS_AVAILABLE:String = "isAvailable";
		
		
		
		public function CircleJavascriptAPI(externalCallbacks:Array) 
		{
			
			_externalCallbacks = externalCallbacks;
			beginCheckingForEI();
		}
		
		private function beginCheckingForEI():void 
		{
			timer = new Timer(100);
			timer.addEventListener(TimerEvent.TIMER, timerHandler);
			timer.start();
		}
		
		private function timerHandler(e:TimerEvent):void 
		{
			if (isAvailable() && circleWrapperAvailable) {
				timer.stop();
				timer.removeEventListener(TimerEvent.TIMER, timerHandler);
				registerCallbacks();
				dispatchEvent(new Event("externalAPI"));
			}
		}
		
		private function registerCallbacks():void 
		{
			sendDebugMessage("registering external callbacks...");
			try{
				var len:int = _externalCallbacks.length;
				sendDebugMessage("...there are " + len + " callbacks...");
			}catch (e:Error) {
				sendDebugMessage(e.message);
			}
			for (var i:int = 0; i < len; i++) {
				var eicv:ExternalInterfaceCallbackVO = _externalCallbacks[i];
				sendDebugMessage("Adding External Callback: "+eicv.methodName);
				flash.external.ExternalInterface.addCallback(eicv.methodName, eicv.closure);
			}
			sendDebugMessage("finished registering external callbacks...!");
		}
		
		public function callMethod(vo:JavascriptCallVO):void 
		{
			// check external interface
			if (!isAvailable()) {
				trace("Cannot call JS methods.  ExternalInterface is not available.");
				return;
			}
			
			// parse vo
			var method:String = vo.method;
			var data:* = vo.data;
			var callback:Function = vo.callback;
			
			// declare result
			var result:*;
			
			// throw error if no method
			if (method == "" || method == null) {
				trace("Cannot call method with empty name.");
				sendDebugMessage("Cannot call method with empty name.");
				return;
			}
			
			// build JS function reference
			var fullMethodName:String = JS_OBJECT_NAME + method;
			
			sendDebugMessage(fullMethodName);
			
			// call with arguments or not
			if (data==null) {
				result=ExternalInterface.call(fullMethodName);
			}else {
				result=ExternalInterface.call(fullMethodName,data);
			}
			
			// handle callback if supplied
			if (callback!=null) {
				callback(result);
			}else {
				trace(fullMethodName+" result::"+result);
			}
		}
		
		public function isAvailable():Boolean 
		{
			var is_EI_available:Boolean=false;
			try{
				is_EI_available = ExternalInterface.available;
				circleWrapperAvailable = Boolean(ExternalInterface.call(CircleJavascriptAPI.JS_OBJECT_NAME+CircleJavascriptAPI.IS_AVAILABLE));
			}catch (e:Error) {
				trace("ExternalInterface is not found.");
			}
			return is_EI_available;
		}
		
		public function sendDebugMessage(message:String):void 
		{
			trace(message);
			ExternalInterface.call(JS_OBJECT_NAME +CircleJavascriptAPI.DEBUG,message);
		}
		
	}

}