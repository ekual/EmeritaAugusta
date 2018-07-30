package utils
{
	import events.TextoDispatcher;
	
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.*;
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.events.MouseEvent;
	import flash.geom.Rectangle;
	import flash.text.*;
	import flash.utils.Timer;
	
	public class Texto extends Sprite
	{
		public var label : TextField ;
		private var format:TextFormat = new TextFormat();
		
		public var frase : String;
		private var aux_string : String;
		public var escrito : Boolean;
		private var bocadillo_scale:Number;
		
		private var bocadillo:Bocadillo;
		
		public static const COMPLETE:String = "complete";
		
		private var warp:Sprite = new Sprite();
		
		public function Texto( str : String = "",s:Number = -1,x:Number = 100,y:Number = 120,w:Number = 400,h:Number = 120)
		{
		
			warp = new Sprite();
			addChild(warp);
			
		//	this.warp.x = x;
		//	this.warp.y = y;
			
			this.bocadillo_scale = s;
			this.escrito = false;
			this.aux_string = new String();
			
			frase = new String();
			label = new TextField();
			label.text = str;
			
			

			label.width = w + 40;
			label.height = h;
			
			label.x = 10;
			label.y = 10;
			
			label.wordWrap = true;
			label.multiline = true;
			label.background = false;
		
			/*
			label.backgroundColor = 0xfafafa;
			label.alpha = 0.8;
			*/
			format.size = 16;
			format.font = "Arial";
			format.color = 0x0F0F0F;
			format.bold = false;
			
			
			label.setTextFormat(format);
	
			
		}
		public function setX(sx : Number):void
		{
			this.label.x = sx;
		}
		public function setY(sy : Number):void // overrido function x
		{
			label.y = sy;
		}
		public function update():void
		{
			label.setTextFormat(format);
			//time++;
			//label.text = "Score: " + time + int(System.totalMemory / 1024) + " kb. " 
		}
		
		public function setText(str:String):void
		{
			label.text = str;
			this.update();
			//this.frase = str;
		}
		public function getText():String
		{
			return label.text;
		}
		public function escribir(str:String):void
		{
			this.frase = str;
			
			bocadillo = new Bocadillo("");
			addChild(bocadillo);
			
			bocadillo.scaleX = this.bocadillo_scale;
			if (this.bocadillo_scale == -1 ) {	bocadillo.x = bocadillo.width; }
			
			bocadillo.addEventListener(Bocadillo.COMPLETE,comienzaEscribir);
			
			
	
			//str es una cadena completa.
		}

		public function comienzaEscribir(e:Event):void
		{
			
			addChild(this.label);
			this.aux_string = this.frase;
			this.label.addEventListener(Event.ENTER_FRAME,escribiendo);
		}
		
		private function escribiendo(e : Event ):void
		{
			var aux_str : String = new String();
			
			
			if (this.label.text.length < this.aux_string.length)
			{
				aux_str = this.aux_string.substr(0,(this.label.text.length+1));
				this.setText(aux_str);
			}else{
				this.label.removeEventListener(Event.ENTER_FRAME,escribiendo);
				this.escrito = true;
				//
				
				var dispatcher :TextoDispatcher = new TextoDispatcher();
				dispatcher.onComplete();
				dispatchEvent(new Event(Texto.COMPLETE));
			}
		}
		
		public function remove():void
		{
			removeChild(this.label);
			removeChild(this.bocadillo);
			this.label = null;
			this.bocadillo = null;
		}
	}
}