package utils
{
	import events.BocadilloDispatcher;
	
	import flash.display.Bitmap;
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.*;
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.events.MouseEvent;
	import flash.filters.BlurFilter;
	import flash.geom.Rectangle;
	import flash.text.*;
	
	public class Bocadillo extends Sprite
	{
		
		// bocadillos properties
		public var container : Sprite;
		
		public var bocata : Movie;
		
		public var state : String;
		
		public var frase : String;
		
		public var aux : String;
		
		public var label : TextField;
		
		public var next_id : Number;
		
		private var w : Number = 500;
		private var h : Number = 120;
		
		private var format :TextFormat = new TextFormat();
		
		private var cont : Number = 0;
		
		public static const COMPLETE:String = "complete";
		
		public function Bocadillo( str : String = "")
		{
			
			this.aux = new String();
			
			frase = new String();
			label = new TextField();
			label.text = str;
			
			
			label.width = w;
			label.height = h;
			
			label.wordWrap = true;
			label.multiline = true;
			label.background = false;
			
			
			format = new TextFormat("Arial",24,0x3f6f80,true);
			/*
			format.size = 33;
			format.font = "Arial";
			format.color = 0x0F0F0F;
			format.bold = true;
			*/
			label.text = "";
				
			label.setTextFormat(format);
			label.x = 20;
			label.y = 20;
			
			container = new Sprite();
			
			//addChild(label);
			//label.htmlText = "<h1 style='font-family:Arial;font-size:30px;0> H O LA </h1>";
			addChild(container);

	
			//container.addChild(bocata);
			bocata = new Movie();
			
			for ( var i : Number = 0  ; i < 11 ; i ++ )
			{
				
			var boc : Sprite = new Sprite();
			boc = createBackground(h*0.1*i,w*0.1*i);
			boc.y = h - h*0.1*i;
			bocata.addClip(boc);
			boc = null;
			}
			
			
			
			container.addChild(bocata);
			//container.swapChildrenAt(0,1);
			addEventListener(Event.ENTER_FRAME,update);
		
			frase = "";
			
		//	bocata.show(10);
		}
		
		function update( e  :  Event ):void
		{
			cont++;
	
			if ( cont < 10 ) { 	bocata.show(cont); } else { cont = 10; bocata.show(cont);
			
				var dispatcher :BocadilloDispatcher = new BocadilloDispatcher();
				dispatcher.onComplete();
				dispatchEvent(new Event(Bocadillo.COMPLETE));
			
				
			} 
		}
		
		function createBackground(h,w):Sprite
		{
			
			var boc : Sprite = new Sprite();
		
			//var pico  = new Sprite();
			boc.graphics.clear();
			boc.graphics.lineStyle(6,0xff00ff,0.8,true,"normal",null,"JointStyle.ROUND");
			
		
			boc.graphics.beginFill(0xfafafa,0.6);
			boc.graphics.moveTo(-30,h+20);
			boc.graphics.lineTo(10,h);
		//	boc.graphics.lineTo(20,h-10);
		//	boc.graphics.curveTo(40,h,50,h)
			//boc.graphics.lineTo(
			boc.graphics.lineTo(w+30,h);
			boc.graphics.curveTo(w+30+15,h,w+30+15,h-15);
			boc.graphics.lineTo(w+30+15,15);
			boc.graphics.curveTo(w+30+15,0,w+30,0);
			boc.graphics.lineTo(15,0);
			boc.graphics.curveTo(0,0,0,15);
			boc.graphics.lineTo(0,h-30);
			boc.graphics.lineTo(-30,h+20);
			boc.graphics.endFill();
			return boc;
		}
				
	}
}