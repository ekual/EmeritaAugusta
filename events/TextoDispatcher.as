package events
{
	
	import flash.events.EventDispatcher;
	import flash.events.Event;

	
	public class TextoDispatcher extends EventDispatcher{

		public static var COMPLETE : String = "complete";
		
		public function onComplete():void {
			dispatchEvent(new Event(TextoDispatcher.COMPLETE));
		}
	}
}