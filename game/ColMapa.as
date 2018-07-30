package game
{
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.events.MouseEvent;
	import flash.filters.GlowFilter;
	import flash.geom.Matrix;
	import flash.geom.Point;
	
	import flashx.textLayout.formats.Float;
	
	import org.papervision3d.core.math.Number3D;
	
	import utils.DataManager;
	
	public class ColMapa extends Sprite
	{

		private var cbmp : Bitmap;
		
		private var mapa_data :BitmapData;
		private var jugador : Sprite;
		
		private var mapa:Sprite;
		
		private var pos_ini_x:int = 378;
		private var pos_ini_y:int = 116;
		
		private var m_pos_x:int = 100;
		private var m_pos_y:int = 100;	
		
		private var pos_x:int = 100;
		private var pos_y:int = 100;
		
		private var h:Number;
		private var w:Number;
		
		private var mapa_bitmap : Bitmap;
		
		
		public function ColMapa(mapa_str:String = "mapa00",pix:Number=378,piy:Number=116)
		{
			
			pos_ini_x= pix;
			pos_ini_y = piy
			//dividid mapa visualizacion
			//mapa colision
		//	this.mapa_data  = new colBitmap().bitmapData;	
			this.mapa_bitmap = EmeritaAugusta.lazy.getBitmap(mapa_str);
		//	this.mapa_bitmap = DataManager.getData(mapa_str);
			//	trace("mapa:"+this.mapa_bitmap);
			this.mapa_data = this.mapa_bitmap.bitmapData;
			
			//this.pos_ini_y = this.mapa_data.height;
			
			this.jugador  = new Sprite();
			this.jugador = square(10);
			
			this.m_pos_y = mapa_bitmap.height;
			
			init()
			
		}
		
		public function init()
		{
			

			
			var container : Sprite = new Sprite();
			addChild(container);
			container.x = 00;
			container.y = 0;
			
			mapa = new Sprite();
	
			
		//	mapa.rotationX = -180;
			/*
			var rect : Sprite = new Sprite();
			rect.graphics.beginFill(0);
			rect.graphics.drawRect(0,0,400,200);
			rect.graphics.endFill();
			container.addChild(rect);
			*/
			
			//mapa bmp
	//		this.h = this.mapa_data.height;
	//		this.w = this.mapa_data.width;
			
		
			//this.mapa_bitmap.mask = rect;
			mapa.addChild(mapa_bitmap);
			
		
		
			container.name = "container";
			container.addChild(mapa);
			
			
			container.addChild(this.jugador);
			container.scaleX = 1;
			container.scaleY = 1;

		
			
		}
		public function getZw(p:Number3D):Number
		{
			var ratio : Number = new Number(40);
			var px : int =   pos_ini_x + (p.x/ratio) ;
			var py : int = m_pos_y - pos_ini_y - (p.z/ratio);
			
			var color : Number = this.mapa_data.getPixel( px, py) ;
			var c:int = new int();
			c = int(Math.floor((color) / 10000)); 
		//	trace("p"+p.x+":"+p.z+"h"+c +"  :"+ color);
			
			return Math.round(c);
		}
		
		public function getZ(p:Number3D):Number
		{
			var ratio : Number = new Number(10);
			var px : int =   pos_ini_x + (p.x/ratio) ;
			var py : int = m_pos_y - pos_ini_y - (p.z/ratio);
			
			var color : Number = this.mapa_data.getPixel( px, py) ;
			var c:Number = new Number();
			c = (color) /3299 ; 
			trace("h"+p.x+":"+p.z+"C"+c +"  :"+ color);
			this.jugador.x = px;
			this.jugador.y = py;
		
			
			return (c - 100);
		}
		
		public function getZ2(p:Number3D):Number
		{
			var ratio : Number = new Number(10);
			var px : int =   pos_ini_x + (p.x/ratio) ;
			var py : int = m_pos_y - pos_ini_y - (p.z/ratio);
			
			var color : Number = this.mapa_data.getPixel( px, py) ;
			var c:Number = new Number();
			c = (color) /32990 ; 
			trace("h"+p.x+":"+p.z+"C"+c +"  :"+ color);
			this.jugador.x = px;
			this.jugador.y = py;
			
			return (c);
		}
		
		public function check(p:Number3D):Boolean
		{
		
		
			//ratio es la diferencia entre el mundo 3d y el mapa
			var ratio : Number = new Number(40);
			
			//this.mapa_bitmap.y = -m_pos_y + pos_ini_y - (p.z/ratio);
			//this.mapa_bitmap.x = -pos_ini_x + (p.x/ratio) ;
			
			this.mapa_bitmap.y = (p.z/ratio);
			this.mapa_bitmap.x = 0 - (p.x/ratio) ;
		//	this.mapa_bitmap.y = -pos_ini_y+ (p.z/ratio) ;
		//	this.mapa_bitmap.x = -pos_ini_x - (p.x/ratio);
			//trace(cbmp--.y);
		//	this.mapa_bitmap.x = m_pos_x;
		//	this.mapa_bitmap.y = m_pos_y;
			
			
			var color : uint = new uint();
			var px : int =   pos_ini_x + (p.x/ratio) ;
			var py : int = m_pos_y - pos_ini_y - (p.z/ratio);
	
			this.jugador.x = pos_ini_x;
			this.jugador.y = m_pos_y - pos_ini_y;
			//			trace("X:"+ px  + ":" + py)
//			this.jugador.x = pos_ini_x; //px;
//			this.jugador.y = pos_ini_y;
			
		//	jugador.x = 15;
		//	jugador.y = 308;

			color = this.mapa_data.getPixel( px, py) ;
			//trace(color + " " +  ":" + px + ":" + py);
			//0 = 329990
			
			var c:int = new int();
			c = int(color) / 329990; 
			
	//		trace("jx: " + jugador.x + " jy: " + jugador.y + " color: " + c);
		
			if (c == 0)
			{return true
			}else{
			return false;}
		}
		public function checkw(p:Number3D):Boolean
		{
			
			
			//ratio es la diferencia entre el mundo 3d y el mapa
			var ratio : Number = new Number(10);
			
			//this.mapa_bitmap.y = -m_pos_y + pos_ini_y - (p.z/ratio);
			//this.mapa_bitmap.x = -pos_ini_x + (p.x/ratio) ;
			
			this.mapa_bitmap.y = (p.z/ratio);
			this.mapa_bitmap.x = 0 - (p.x/ratio) ;
			//	this.mapa_bitmap.y = -pos_ini_y+ (p.z/ratio) ;
			//	this.mapa_bitmap.x = -pos_ini_x - (p.x/ratio);
			//trace(cbmp.y);
			//	this.mapa_bitmap.x = m_pos_x;
			//	this.mapa_bitmap.y = m_pos_y;
			
			
			var color : uint = new uint();
			var px : int =   pos_ini_x + (p.x/ratio) ;
			var py : int = m_pos_y - pos_ini_y - (p.z/ratio);
			
			this.jugador.x = pos_ini_x;
			this.jugador.y = m_pos_y - pos_ini_y;
			//			trace("X:"+ px  + ":" + py)
			//			this.jugador.x = pos_ini_x; //px;
			//			this.jugador.y = pos_ini_y;
			
			//	jugador.x = 15;
			//	jugador.y = 308;
			
			color = this.mapa_data.getPixel( px, py) ;
			//trace(color + " " +  ":" + p.z + ":" + px);
			//0 = 329990
			
			var c:int = new int();
			c = int(color) / 329990; 
			
			//	trace("jx: " + jugador.x + " jy: " + jugador.y + " color: " + c);
		
			if (c == 50)
			{return true
			}else{
				return false;}
		}
		
		public function checkw2(p:Number3D):Boolean
		{
			
			
			//ratio es la diferencia entre el mundo 3d y el mapa
			var ratio : Number = new Number(1);
			
			//this.mapa_bitmap.y = -m_pos_y + pos_ini_y - (p.z/ratio);
			//this.mapa_bitmap.x = -pos_ini_x + (p.x/ratio) ;
			
			this.mapa_bitmap.y = (p.z/ratio);
			this.mapa_bitmap.x = 0 - (p.x/ratio) ;
			//	this.mapa_bitmap.y = -pos_ini_y+ (p.z/ratio) ;
			//	this.mapa_bitmap.x = -pos_ini_x - (p.x/ratio);
			//trace(cbmp.y);
			//	this.mapa_bitmap.x = m_pos_x;
			//	this.mapa_bitmap.y = m_pos_y;
			
			
			var color : uint = new uint();
			var px : int =   pos_ini_x + (p.x/ratio) ;
			var py : int = m_pos_y - pos_ini_y - (p.z/ratio);
			
			this.jugador.x = pos_ini_x;
			this.jugador.y = m_pos_y - pos_ini_y;
			//			trace("X:"+ px  + ":" + py)
			//			this.jugador.x = pos_ini_x; //px;
			//			this.jugador.y = pos_ini_y;
			
			//	jugador.x = 15;
			//	jugador.y = 308;
			
			color = this.mapa_data.getPixel( px, py) ;
			//trace(color + " " +  ":" + p.z + ":" + px);
			//0 = 329990
			
			var c:int = new int();
			c = int(color) / 329990; 
			
			//	trace("jx: " + jugador.x + " jy: " + jugador.y + " color: " + c);
			
			if (c == 50)
			{return true
			}else{
				return false;}
		}
		public function square(s:int):Sprite
		{
			var square : Sprite = new Sprite();
			square.graphics.lineStyle(2,0xffffff);
			square.graphics.beginFill(0xE6D8AC);
			square.graphics.drawRect(0,0,s,s);
			square.graphics.endFill();
			return square;
			
		}
		public function update():void
		{
		//	this.jugador.x = px + pos_ini_x;
		//	this.jugador.y = py + pos_ini_y;
		}
	}
}