package
{
		import br.com.stimuli.loading.lazyloaders.LazyBulkLoader;
		import br.com.stimuli.loading.lazyloaders.LazyXMLLoader;
		
		import com.bit101.components.HUISlider;
		import com.bit101.components.VUISlider;
		
		import flash.display.Bitmap;
		import flash.display.BitmapData;
		import flash.display.Sprite;
		import flash.display.Stage;
		import flash.events.Event;
		import flash.events.MouseEvent;
		import flash.events.ProgressEvent;
		import flash.filters.BlurFilter;
		import flash.geom.Matrix3D;
		import flash.geom.Rectangle;
		import flash.media.Sound;
		import flash.media.SoundChannel;
		import flash.media.SoundMixer;
		import flash.text.TextField;
		import flash.text.TextFormat;
		import flash.utils.ByteArray;
		import flash.utils.getTimer;
		
		import game.Dummy;
		import game.Level01;
		import game.Level02;
		
		import interfaze.Interfazei;
		import interfaze.Quiz;
		
		import org.papervision3d.core.math.Number3D;
		
		import prueba.Lira;
		
		import utils.DataManager;
		import utils.Escena;
		import utils.Escena_conversacion;
		import utils.Movie;
		import utils.Point3D;
		import utils.Texto;
		
		[SWF (width="1300", height="700", backgroundColor="0xFFFFFF")]	
		
		
	public class EmeritaAugusta extends Sprite
	{

		public static var HEIGHT : Number = 700;
		public static var WIDTH : Number = 1300;
		
		public static var lazy :LazyXMLLoader;
		
		private var warp : Sprite;
		

		
		public var interfazei:Interfazei;
		
		protected var lastFrameTime:uint;

		private var lira:Lira;

		public static var channel:SoundChannel;
		
		public static var activo = 0;
		
		private var escena:Escena;
		
		private var speed:Number = 80;
		private var jumpSpeed:Number = 160;
		private var gravity:Number = 500;
		
		private var pos:Number3D;
		private var rot:Number;
		
		
		private var GAME : Game;
		private var level02 : Level02;	
		private var level01:Level01;
		
		private var quiz:Quiz;
		private var conversacion:Escena_conversacion;
		
		
		public function EmeritaAugusta()
		{
			
			pos = new Number3D(0,0,0);
			rot = new Number();

			channel = new SoundChannel();

		
	
			stage.frameRate = 20;
			stage.quality ="LOW";
			warp = new Sprite();
			var eventos : Eventos = new Eventos(stage);
			
			//una clase para inicializar un bulkloadER estatico
			lazy = new LazyXMLLoader("assets/data4load.xml", "main_loader");
			lazy.addEventListener(Event.COMPLETE, onLazyLoaded);
			lazy.addEventListener(ProgressEvent.PROGRESS, onLazyProgress);
			lazy.start();
		}
		public function onLazyProgress(e:ProgressEvent):void
		{
			
			trace("data" + e.bytesLoaded + "/" + lazy.bytesTotal);
			
		//	label.text ="data" + e.bytesLoaded + "/" + lazy.bytesTotal;
		}
		
		
		public function onLazyLoaded(e:Event):void
		{
			trace("loaded");
			//level01 = new Level01();
			//set data
	//		GAME = new Game();
			//		level02 = new Level02();
			interfazei = new Interfazei(stage);
			level01 = new Level01();
			init();
		}
		
		public function init():void
		{
			addChild(this.warp);
			//	warp.addChild(GAME);
			warp.addChild(interfazei)
			warp.addChild(level01);
				
			//poner un timer
			warp.addEventListener(Event.ENTER_FRAME,update);
			quiz = new Quiz();
			warp.addChild(quiz);
			
			//CONTROLLER

			
		}
		
		private function update(e:Event):void
		{
		//	processInput();
			// TIMER
			
			if ( Eventos.activo == 0 )
			{
				//	GAME.update();
				level01.update();
			}else{
		
					if (activo == 0 )
					{
						//GAME.stopSound();
						quiz.update();
						warp.removeEventListener(Event.ENTER_FRAME,update);
						
						/*
						
						var escena_number = new Number();
						escena_number = Eventos.activo;
						
						//posit = new Escena_posit();
						var conversacion = new Escena_conversacion(escena_number);
						
						switch (escena_number)
						{
							case 2 :
									conversacion = new Escena_conversacion(escena_number);
									warp.addChild(conversacion);
									conversacion.addEventListener(Escena.COMPLETE,complete);
									activo = 1;
									break;
						}
						*/
					//	trace("escena");
					//	escena = new Escena(escena_number);
					//	warp.addChild(escena);	
										
					//	escena.addEventListener(Escena.COMPLETE,complete);
					//	activo = 1;
					}
					
			}
				
		
		}
		
		
		public function complete_texto(e:Event):void
		{
			trace("complete t");
			warp.removeChild(escena);
			activo = 0;
		}
		
		public function complete(e:Event):void
		{
			trace("complete");
		}
			
		public function processInput()
		{
			var _loc_1:* = getTimer() - this.lastFrameTime;
			if (_loc_1 == 0)
			{
				return;
			}
			this.lastFrameTime = this.lastFrameTime + _loc_1;
			if (_loc_1 > 100)
			{
				_loc_1 = 100;
			}
			_loc_1 = _loc_1 / 1000;
			rotateObject(_loc_1);
			getDisplacement(_loc_1);
			applyDisplacement();
		}
		public function rotateObject(t:Number):void
		{
				if (Eventos.keyDe){ rot += 100 * t; }
				if (Eventos.keyIz){ rot -= 100 * t; }
		}
		public function getDisplacement(t:Number):void
		{
			if (Eventos.keyW) { pos.x += speed * t; }
			if (Eventos.keyS) { pos.x -= speed * t; }

			if (Eventos.keyA) { pos.z -= speed * t; }
			if (Eventos.keyD) { pos.z += speed * t; }
		}
		public function applyDisplacement():void
		{
			GAME.setPos(pos,rot);
			GAME.update();
		}
		
		
		
	}
}