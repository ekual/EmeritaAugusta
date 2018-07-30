package utils
{
	import events.FraseDispatcher;
	
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.media.Sound;
	import flash.media.SoundChannel;
	
	public class Frase extends Sprite
	{
		private static var sonidof:Boolean  = false;
		private static var textof:Boolean = false;
		
		public static const COMPLETE:String = "complete";
		
		private var sound:Sound;
		private var text :Texto;
		
	//	private var channel:SoundChannel;

		
		public function Frase(sonido:Sound,texto:Texto,str:String)
		{

			text = texto;
			sound = sonido;
			
			text.escribir(str);
			
			trace(sonido);
			EmeritaAugusta.channel = sound.play();
			
			texto.addEventListener(Texto.COMPLETE,onCompleteTexto);
			EmeritaAugusta.channel.addEventListener(Event.SOUND_COMPLETE,onCompleteAudio);

			//dispatcher = new FraseDispatcher();	

		}
		
		public function onCompleteTexto(e:Event):void
		{
		
			textof = true;
			
			if (sonidof == true) {
				text = null;
				sound = null;
			var dispatcher :FraseDispatcher = new FraseDispatcher();
				dispatcher.onComplete();
				dispatchEvent(new Event(Frase.COMPLETE));		
		
			}
		}
		public function onCompleteAudio(e:Event):void
		{
			
			sonidof = true;
			
			if (textof == true) {
				text = null;
				sound = null;
				var dispatcher:FraseDispatcher = new FraseDispatcher();
				dispatcher.onComplete();
				dispatchEvent(new Event(Frase.COMPLETE));		
			
			}
		}

	}
}