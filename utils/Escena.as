package utils
{
	import com.greensock.TweenLite;
	
	import events.EscenaDispatcher;
	
	import flash.display.Bitmap;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.events.MouseEvent;
	import flash.media.Sound;
	import flash.media.SoundChannel;
	
	import prueba.Lira;
	
	import utils.Bocadillo;
	import utils.Boton;
	import utils.Movie;
	import utils.Texto;
	
	public class Escena extends Sprite
	{
		private var texto_actual : String;
		private var sound_name : String;
		private var actor_name : String;
		
		private var texto:Texto;
		
		private var actor:Movie;
		
		private var conversacion:Array;
		
		private var frase:Frase;
		
		public static const COMPLETE:String = "complete";
		
		public static var CONT = 0;
		
		private var sound:Sound;
	//	public static var array_frases_dichas;
		
		public function Escena(n:Number)
		{
			/*
			this.conversacion = new Array(
				["piva05","anas001","¿Qué hay? Soy Anas,me gusta mucho la música y lo que mas el latin-jazz, mi idolo es Horacio ''el negro''. "]				,
				
				["piva05","anas002"," También me interesa la arqueología. Quiero sacar buena nota en selectividad para ir a una buena universidad."],
				
				["piva05","anas003","Los fines de semana me dedico a pasear por la calle Santa Eulalia y salir con mi primo de escalada, ah! Os recomiendo 'El sindrome de Mozart' el libro que espero terminar esta noche."]
				
			);
		*/
			this.conversacion = new Array(
				["piva05","anas001","¿Qué hay? Soy Anas,me gusta mucho la música y lo que mas el latin-jazz, mi idolo es Horacio ''el negro''. "]				,
				
				["piva05","anas002"," También me interesa la arqueología. Quiero sacar buena nota en selectividad para ir a una buena universidad."],
				
				["piva05","anas003","Los fines de semana me dedico a pasear por la calle Santa Eulalia y salir con mi primo de escalada, ah! Os recomiendo 'El sindrome de Mozart' el libro que espero terminar esta noche."]
				
			);
			
			texto_actual = new String();
			sound_name = new String();
			sound = new Sound();
			
			texto = new Texto();
			addChild(texto);
		
			this.actor = new Movie();
			addChild(actor);

			play();
		}
		public function play()
		{
			
			texto_actual = conversacion[CONT][2];
			sound_name = conversacion[CONT][1];
			actor_name = conversacion[CONT][0];
			
			sound = EmeritaAugusta.lazy.getSound(sound_name);
			actor.addClip(EmeritaAugusta.lazy.getBitmap(actor_name));
		
			addChild(texto);
			

			actor.show(0);
			
			frase = new Frase(sound,texto,texto_actual);
			
			frase.addEventListener(Frase.COMPLETE,addListener);
		}
	
		public function addListener(e:Event):void
		{
			this.texto.addEventListener(MouseEvent.CLICK,next);
		}

		public function next(e:Event=null):void{
			
			texto.removeEventListener(MouseEvent.CLICK,next);
			trace("next");
			CONT++;
			if (CONT < conversacion.length ){
				removeChild(texto);
				play();
			}else {
				trace("cerrar listener");
				CONT = 0;
				texto.addEventListener(MouseEvent.CLICK,cerrar);
				var dispatcher :EscenaDispatcher = new EscenaDispatcher();
				dispatcher.onComplete();
				dispatchEvent(new Event(Escena.COMPLETE));	
			}
		}
		public function cerrar(e:Event=null):void{
			
			trace("cerrar");
			texto.remove();
		}
	
	}
}
/*
package
{
import flash.display.Bitmap;
import flash.display.Sprite;
import flash.events.Event;
import flash.events.MouseEvent;
import flash.media.Sound;
import flash.media.SoundChannel;

import sounds.SoundManager;
import sounds.SoundTrack;

public class Escena1 extends Sprite
{

private static var CONT = 0;
private var sound : Sound;
private var sound_name:String;

private var channel : SoundChannel;
public var texto : Texto;
public var texto2 : Texto;

public var boton : Button;

private var container:Sprite;

private var texto_actual : String;

private var conversacion : Array;

private var actor:String;

private var frase:Frase;

public function Escena1()
{


texto = new Texto("string");


conversacion = new Array(
["piva","anas000","¿Qué hay? Soy Anas,me gusta mucho la música y lo que mas el latin-jazz, mi idolo es Horacio ''el negro''. "]				,

["piva","anas001"," También me interesa la arqueología. Quiero sacar buena nota en selectividad para ir a una buena universidad."],

["piva","anas002","Los fines de semana me dedico a pasear por la calle Santa Eulalia y salir con mi primo de escalada, ah! Os recomiendo 'El sindrome de Mozart' el libro que espero terminar esta noche."]


);
texto_actual = new String();
texto_actual = conversacion[CONT][2];

sound_name = conversacion[CONT][1];
sound = Game.lazy.getSound(sound_name);



actor = conversacion[CONT][0];
var bmp : Bitmap = Game.lazy.getBitmap(actor);
addChild(bmp);

addChild(texto);

play();
//addChild
//addEventListener
}
public function play()
{

texto_actual = conversacion[CONT][2];

sound_name = conversacion[CONT][1];
sound = Game.lazy.getSound(sound_name);


frase = new Frase(sound,texto,texto_actual);

frase.addEventListener(Frase.COMPLETE,addListener);


//	
//channel.stop();
//sound.play();
//sound.addEventListener(Event.COMPLETE,next);
//SoundManager.play("music",sound);
//texto.escribir(texto_actual);
//texto.addEventListener(Texto.COMPLETE,next);


}
public function addListener(e:Event):void
{
trace("complete");
this.texto.addEventListener(MouseEvent.CLICK,next);
}
public function next(e:Event=null):void{

trace("next");
CONT++;
if (CONT < conversacion.length ){

play();
}else {
CONT = 0;

//sceneManager.setScene(new EmptyScene(container));
//dispatch Event
//remove
}
}

}
}
*/