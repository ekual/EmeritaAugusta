package interfaze{
	
	import br.com.stimuli.loading.BulkLoader;
	
	import flash.display.*;
	import flash.display.Loader;
	import flash.events.*;
	import flash.geom.Rectangle;
	import flash.net.URLRequest;
	
	import interfaze.Quiz;
	
	import org.papervision3d.materials.BitmapMaterial;
	
	import utils.Movie;
	

	public class Interfazei extends Sprite
	{
		
		//private var back : Sprite;
		
		//private var state : State;
		
		//private var buttons : ButtonsCollection;
		
		//private var state : State;
		[Embed (source="assets/frame_top.png")]
		private var interfazeBitmap : Class; 
		private var ibmp:Bitmap = new interfazeBitmap ();
		
		[Embed (source="assets/frame_bot.png")]
		private var ibotBitmap : Class;
		private var ibotbmp:Bitmap = new ibotBitmap();
		
		private var STAGE_WIDTH : Number = new Number();
		private var STAGE_HEIGHT : Number = new Number()
		private var SCREEN_WIDTH : Number = new Number();
		private var SCREEN_HEIGHT : Number = new Number();
		
		private var player : Movie;
		private var bkL : BulkLoader;

	
		private var mapa : Mapa;

		private var quiz : Quiz;
	
	//	private var mochila : Mochila;
		
		private var cont : Number = 0;
		
		private var ci:Number = 0;
		
		public function Interfazei(stage:Stage)//(level:String) 
		{
			trace ("Interfaze.as : Stage properties :: " + "stageWidth : " + stage.stageWidth + " height : " + stage.stageHeight)
			
			STAGE_WIDTH = 1360;
			STAGE_HEIGHT = 800;
			
			var cx : Number = STAGE_WIDTH / 2;
			ci = cx - 100;
			//INTERFAZE PNG
			ibmp.alpha = 0.4;
			
			addChild(ibmp);
			
			addChild(ibotbmp);
			ibotbmp.y = STAGE_HEIGHT - ibotbmp.height;
	
			
		//	mapaC = new MapaCol();
		//	addChild(mapaC);
			
			//mapa = new Mapa();
			//addChild(mapa);
			
			quiz = new Quiz();
			addChild(quiz);
			
	//		mochila = new Mochila();
	//		addChild(mochila);
	
			player = new Movie();
			addChild(player);
			player.y = 200;
			player.x = cx - 150;
			player.scaleX = player.scaleY = 1;
			
			addChild(ibotbmp);
			// LOAD MOVIE ( url,name,ext)
		

			
			var url : String = "/assets/";
			var name: String = "piva_back";
			var ext : String = ".png";
			
			player.addClip(EmeritaAugusta.lazy.getBitmap("piva00"));
			player.addClip(EmeritaAugusta.lazy.getBitmap("piva01"));
			player.addClip(EmeritaAugusta.lazy.getBitmap("piva02"));
			player.addClip(EmeritaAugusta.lazy.getBitmap("piva05"));
			
			
			
			//this.addEventListener(Event.ENTER_FRAME,update);
		
		
		}
		
		
		private function nameN(base:String,name:String,ext:String,n : Number = 0):String
		{
			var aux : String = "";
			
			n<10 ?  aux =  base +  name + "0" + n + ext 
			: aux = base + name + n + ext ; 
			
			return aux;
			 
		}
		
		public function update():void
		{
		
			//quiz.update();

			if ( Eventos.activo == 0 )
			{
				if ( Eventos.keyUp ) {cont ++; } else {
					if ( Eventos.keyDn ) {cont --;  } else { cont = 2; }}
				
				
				if (cont < 1 ) { cont = 2;}
				if ( cont >= 2) { cont = 0; }
				
				player.show(cont);
				player.x = this.ci;
				
			}else{
				player.show(3);
				player.x = 10;
			}
	//		trace(cont);
	//		player.update()
		/*
			if	((Eventos.hablando))
			{ 
				
				player.show(3);
				player.x = 10;
				
			}else{
				if ( Eventos.keyUp ) {cont ++; } else {
					if ( Eventos.keyDn ) {cont --;  } else { cont = 2; }}
			
			
				if (cont < 1 ) { cont = 2;}
				if ( cont >= 2) { cont = 0; }
				
				player.show(cont);
				player.x = this.ci;
			}
		*/	

		
		}
	}
}


/*
private function onEnterFrame(event:Event):void {
var bytes:ByteArray = new ByteArray();
const PLOT_HEIGHT:int = 200;
const CHANNEL_LENGTH:int = 256;

SoundMixer.computeSpectrum(bytes, false, 2);

var n:Number = 0;
var m:Number = 0;

for (var i:int = 0; i < CHANNEL_LENGTH; i++) {
n = (bytes.readFloat() * PLOT_HEIGHT);
if (n > m) { m = n; }
}

if (Math.round(m) > 20) {	 emeria.show(1); }else {emeria.show(0)}


}
*/