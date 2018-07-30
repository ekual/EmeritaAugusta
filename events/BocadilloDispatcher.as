package events
{
	
	import flash.events.EventDispatcher;
	import flash.events.Event;
	
	
	public class BocadilloDispatcher extends EventDispatcher{
		
		public static var COMPLETE : String = "complete";
		
		public function onComplete():void {
			dispatchEvent(new Event(BocadilloDispatcher.COMPLETE));
		}
	}
}