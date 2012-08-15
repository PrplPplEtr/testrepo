package  
{
	/**
	 * ...
	 * @author Christian Dewinetz
	 */
	public class ExternalInterfaceCallbackVO 
	{
		public var methodName:String;
		public var closure:Function;
		
		public function ExternalInterfaceCallbackVO(method:String,callback:Function) 
		{
			methodName = method;
			closure = callback;
		}
		
	}

}