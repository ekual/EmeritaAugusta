package events
{
	
	import flash.events.EventDispatcher;
	import flash.events.Event;
	
	public class EscenaDispatcher extends EventDispatcher{
	
		
		public static var COMPLETE : String = "complete";
		
		public function onComplete():void {
			dispatchEvent(new Event(EscenaDispatcher.COMPLETE));
		}
		
	}
}
