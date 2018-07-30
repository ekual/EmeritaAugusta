package interfaze
{
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.DisplayObject;
	import flash.display.Graphics;
	import flash.display.Sprite;
	
	import utils.Texto;
	
	public class Mapa extends Sprite
	{


		[Embed (source="assets/mapa_2d.png")]
		private var mapaBitmap : Class; 
		private var mbmp:Bitmap = new mapaBitmap();

	

		private var mapa_data : BitmapData;
		
		
		private var fondo : Sprite;
		private var jugador : Sprite;
		private var texto : Texto;
		
		private var square01 : Sprite;
		
		private var personasa : Array;
		private var lugaresa : Array;
		

		
		private var color:int;
		
		private var RB:int ;
		private var LB:int ;
		private var TB:int ;
		private var BB:int ;
		
		//mapa_sprite
		private var mapa_bmp : Bitmap;
		private var mapa_sprite : Sprite;
		
		public function Mapa()
		{
		
			this.mapa_data  = new mapaBitmap().bitmapData;	
			
			this.fondo = new Sprite();
			addChild(fondo);
			fondo.scaleX = 1;
			fondo.scaleY = 1;
			
			fondo.x = 0;
			fondo.y = 400;
			
		//fondo.rotationX = 180;
		
			fondo.addChild(mbmp);
			//mbmp.rotationX = -180;
			//square01 = new Square(130);
			//fondo.addChild(square01);
			//square01.x = 10;
			//square01.y = 20;
			
			
			
			this.texto = new Texto("jugador");
			addChild(texto);
			

			/*
			var nbmp : BitmapData = new BitmapData(400,270,0,0xffffff);
			var bmp : Bitmap = new Bitmap(nbmp);
			var mask : Sprite = new Sprite();
			
			mapa_sprite = new Sprite();
			addChild(mapa_sprite);
			
			
			mapa_bmp = bmp;
			mapa_sprite.addChild(mbmp);
			mapa_sprite.addChild(mapa_bmp);
			
			mbmp.mask = mapa_bmp;
			//sprite.mask = nbmp;
		
		//	mbmp.rotationX = -180;
	
			//init();
			
			
			mapa_sprite.y = 400;
			mbmp.x = 20;
		*/
			
			this.fondo.rotationX = 180;
			Eventos.collide = true;
			Eventos.boundedx = 20;
			Eventos.boundedy = 20;
	
	
			
			//inicializo el jugador2D que recogera los puntos de colisios
			//y obtiene 
			this.jugador = new Sprite();
			this.jugador = square(3);
			fondo.addChild(jugador);
			//setY(Eventos.jx);
			//setX(Eventos.jy );
		
			
	
			
			
		}
		

	
	
	private function setX(x:Number):void
		{
			
			jugador.x = x;			
			
		}
		
		private function setY(y:Number):void
		{
			
			jugador.y = y;			
			
		}		
		public function square(s:int):Sprite
		{
			var square : Sprite = new Sprite();
			square.graphics.lineStyle(3,0x000000);
			square.graphics.beginFill(0xE6D8AC);
			square.graphics.drawRect(0,0,s,s);
			square.graphics.endFill();
			return square;
			
		}
		
		public function t( a : Number ) : Number
		{
			return ( (a  )* 1000   );			
		}		
		
		public function getLimitX(yo:int):Number
		{
			var l : int = 0;
			
			return l;
		}
		
		//check collision
		// O O x o o o o x O O
		// x x x x x x x x x x
		// O O X O O O O O O O
		public function getV(jx:int,jy:int):Array
		{
			var vi : int;
			var vj :int;
			vi = Math.round(jx / 10);//n
			vj = Math.round(jy/10);//m
			return new Array(vi,vj);
		}
		
		public function checkCollision(xo:int,yo:int):Array{
			return null;
		}
		
		public function update():void
		{
		
					
		if (Eventos.jx == 0){Eventos.jx ++;}
		if (Eventos.jy == 0){Eventos.jy ++;}
	
		//set value xo = Eventos.jx
		var xo : Number = (Eventos.jx/1000);	//xo
		var yo : Number = (Eventos.jy/1000);
		
		Eventos.collide=false;
		//mapa_sprite.getChildAt(0).y = + yo;
		//mapa_sprite.getChildAt(0).x = + xo;
	//trace("xo:"+xo+"yo:"+yo);
		//set jugador 2d val = jugador
		this.setX(xo);
		this.setY(yo);
		texto.setText("jugador : " + xo+ " y:" + yo);
	
			
			var pz : int = new int();
			pz = this.mapa_data.getPixel(xo,yo);
			var p : int = pz / 1000000;
			//trace(xo+":"+yo+":"+pz);
					
			//Eventos.boundedz = tColo(pz);
			
			RB = tColo(this.mapa_data.getPixel(xo-1,yo));
			LB = tColo(this.mapa_data.getPixel(xo+1,yo));
			TB = tColo(this.mapa_data.getPixel(xo,yo+1));
			BB = tColo(this.mapa_data.getPixel(xo,yo-1));
			
			//trace("Colors:"+TB+":"+RB+":"+BB+":"+LB);
			/*	*/
	
			if ( RB > 10 || LB > 10 || TB > 10 || BB > 10 ) { Eventos.collide = true;
				if ( RB > 10)	 { 
					
					Eventos.boundedx  = xo + 1;
					Eventos.boundedy = yo;
					
				if (LB> 10) { Eventos.boundedy = yo; Eventos.boundedx = xo-1.2;}
				
				
				if (TB > 10) {  Eventos.boundedx = xo;Eventos.boundedy = yo-1 ;}
				if (BB > 10) {  Eventos.boundedx = xo;Eventos.boundedy = yo+1;}
				
			}else { 
				Eventos.collide = false;
				Eventos.boundedx = xo;
				Eventos.boundedy = yo;
				}
			}
			
		}
		
		function tColo(color:int):int
		{
		 	if (color==0 ){color--;}
			return color/1000000;
		}
		

	}
}