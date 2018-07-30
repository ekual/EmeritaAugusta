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
	
	public class Escena_conversacion extends Sprite
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
		
		private var warp:Sprite;
		
		public function Escena_conversacion(n:Number)
		{
			/*
			this.conversacion = new Array(
				["piva05","anas001","¿Qué hay? Soy Anas,me gusta mucho la música y lo que mas el latin-jazz, mi idolo es Horacio ''el negro''. "]				,
				
				["piva05","anas002"," También me interesa la arqueología. Quiero sacar buena nota en selectividad para ir a una buena universidad."],
				
				["piva05","anas003","Los fines de semana me dedico a pasear por la calle Santa Eulalia y salir con mi primo de escalada, ah! Os recomiendo 'El sindrome de Mozart' el libro que espero terminar esta noche."]
				
			);
		*/
			
			warp = new Sprite();
			addChild(warp);
			
			var boc_x:Number = 100;
			var boc_y:Number = 120;
			var w : Number = 200;
			var h : Number = 90;

			var bocb_x:Number = 500;
			var bocb_y:Number = 120;
			var wb : Number = 200;
			var hb : Number = 90;
		
			this.conversacion = new Array(
				["piva05","anas001","¿Qué hay? Soy Anas,me gusta mucho la música y lo que mas el latin-jazz, mi idolo es Horacio ''el negro''. ",-1,boc_x+400,boc_y,w,h]				,
				
				["romano03","anas002"," soldado También me interesa la arqueología. Quiero sacar buena nota en selectividad para ir a una buena universidad.",1,bocb_x,bocb_y,wb,hb],
				
				["piva05","anas002"," También me interesa la arqueología. Quiero sacar buena nota en selectividad para ir a una buena universidad.",-1,boc_x+400,boc_y,w,h],
				
				["romano03","anas002"," soldado También me interesa la arqueología. Quiero sacar buena nota en selectividad para ir a una buena universidad.",1,bocb_x,bocb_y,wb,hb],
				
				["piva05","anas003","Los fines de semana me dedico a pasear por la calle Santa Eulalia y salir con mi primo de escalada, ah! Os recomiendo 'El sindrome de Mozart' el libro que espero terminar esta noche.",-1,boc_x,boc_y,w,h]
				
			);
			
			texto_actual = new String();
			sound_name = new String();
			sound = new Sound();
			
			texto = new Texto();
			warp.addChild(texto);
		
			this.actor = new Movie();
			warp.addChild(actor);

			play();
		}
		public function play()
		{
			
			texto_actual = null;
			texto = null;
			sound_name = null;
			actor_name = null;
			sound = null;
			
			frase = null;
			
			texto_actual = conversacion[CONT][2];
			texto = new Texto(texto_actual,conversacion[CONT][3],conversacion[CONT][4],conversacion[CONT][5],conversacion[CONT][6],conversacion[CONT][7]);
			sound_name = conversacion[CONT][1];
			actor_name = conversacion[CONT][0];
			
			sound = EmeritaAugusta.lazy.getSound(sound_name);
			actor.addClip(EmeritaAugusta.lazy.getBitmap(actor_name));
		
			warp.addChild(texto);
			texto.x = conversacion[CONT][4];
			texto.y = conversacion[CONT][4];

			actor.show(0);
			
			frase = new Frase(sound,texto,texto_actual);
			
			frase.addEventListener(Frase.COMPLETE,addListener);
		}
	
		public function addListener(e:Event):void
		{
			trace("COMPLTE B");
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
			removeChild(warp);
		//	texto.remove();
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