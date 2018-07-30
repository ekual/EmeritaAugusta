package utils
{
	import flash.display.Bitmap;
	import flash.display.Loader;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.net.URLRequest;

	/**
	 * 
	 * 	Movie extends MovieClip : Esta clase sirve para reprroducir sucesiones de imagenes
	 * 								puede ser extensible a MOVIE MANAGER, se harian modificaciones
	 * 								para que mostrara varios clips a la vez
	 * 
	 * 	propiedades:
	 * 	animacion
	 *  fotogramas
	 *  fotograma_inicial
	 *  fotograma_actual
	 * 	
	 * 
	 * 
	 *    STOP??
	 * */
	public class Movie extends Sprite
	{ 
		private var loader:Loader;

			public var sprite:Sprite;
			
			private var array : Array;
		
			private var cont : Number = 0;
		
		public function Movie()
		{
			array = new Array();
			
			sprite = new Sprite();
			addChild(sprite);
			loader = new Loader();
			
		}
		public function getMovie():Sprite{return this.sprite; } // debugg purpouses
	

		public function addClip(sprite:*):void
		{
			array.push(sprite);
		}
		public function play():void
		{
			sprite.addEventListener(Event.ENTER_FRAME,reproducir);	
		}
		public function stop(n:int = 0)
		{
			hide();
			sprite.removeEventListener(Event.ENTER_FRAME,reproducir);
			sprite.addChild(array[n]);
		}
		public function reproducir(e:Event)
		{ 
			hide();
			
			//sprite show
			
			sprite.addChild(array[cont]);
			cont++;
			if (cont >= array.length){ cont = 0; }
			//sprite hide
		}
		public function shown(c:Number)
		{
			hide();
			
			sprite.addChild(array[c]);
			
		}
		public function show(n:int)
		{
			hide();
			//trace(array[n]);
			sprite.addChild(array[n]);
		}
		public function hide():void
		{
			for (var i : int = 0 ; i < sprite.numChildren ; i ++)
			{
				sprite.removeChildAt(0);
			}
		
		}
		
		public function loadpath(name:String,base:String,ext:String,n:Number,nb:Number):void
		{
			
	
			for (var i:Number = n ; i < nb ; i++)
			{
				var name : String = nameN(base,name,ext,i);
				
			
			
				var url:String = name;
				var urlReq:URLRequest = new URLRequest(url);
				loader.load(urlReq);
				loader.addEventListener(Event.COMPLETE, onLoad);

			}
			
		}
		public function onLoad(e:Event):void
		{
			var spt:Sprite = e.target as Sprite;
			trace(spt);
			this.array.push(spt);
			spt = null;
		}
		public function nameN(base:String,name:String,ext:String,n : Number = 0):String
		{
			var aux : String = "";
			n<100 ?aux = base + name + "0" + ext : aux = base + name + n + ext;
			
			n<10 ?  aux =  base +  name + "0" + n + ext 
				: aux = base + name + n + ext ; 
			
			return aux;
			
		}
	}
}