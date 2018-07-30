package{

	import flash.display.Sprite;
	import flash.display.Stage;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.events.MouseEvent;
	import flash.geom.Point;
	import flash.ui.Keyboard;
	import flash.ui.Mouse;
	
	public class Eventos
	{
		//registros
		public static var collide :	Boolean;
		public static var boundedx : Number;
		public static var boundedy : Number;
		public static var boundedz : Number;
		// 0 . Eventos de teclado
		
		public static var keyW	:	Boolean;
		public static var keyA	:	Boolean;
		public static var keyD	:	Boolean;
		public static var keyS	: 	Boolean;
		public static var keyZ    :	Boolean;

		public static var keyUp	:	Boolean;
		public static var keyDn	:	Boolean;
		public static var keyIz	:	Boolean;
		public static var keyDe 	:	Boolean;

			
		public static var keyEsc:	Boolean;
		public static var keyEnt:	Boolean;
		public static var keySpc:	Boolean;

		public static var keySh:	Boolean;

		
		public static var keyn1 :	Boolean;
		public static var keyn2 : 	Boolean;
		public static var keyn3 :	Boolean;
		
		public static var key1 : Boolean;
		public static var key2 : Boolean;
		public static var key3 : Boolean;
		public static var key4 : Boolean;
		public static var key5 : Boolean;
		public static var key6 : Boolean;
		public static var key7 : Boolean;
		public static var key8 : Boolean;

		//1 . Eventos de ratón

		public static var msLCk	:	Boolean;
		public static var msDCk	:	Boolean;
		public static var msRCk	:	Boolean;
		public static var msWhl : 	Number;

		public static var msPX	:	Number;
		public static var msPY	:	Number; 


		public static var lastMP : Point;// = new Point(); 
		public static var isMD 	:	Boolean; 
		
		public static var jx : Number;
		public static var jy : Number;

			
		public static var X :Number = 0;
		public static var Y :Number = 100;
		public static var z :Number = 0;
		public static var fov : Number = 24;
		public static var rx : Number = 0;
		public static var back : Number = 200;
		public static var up : Number = 10;
		//2.. Eventos de stado
		public static var rot:Number = 0 ;

		public static var activo : Number = 0 ; 
		public static var hablando : Boolean =false ;
		
		public function Eventos(stage:Stage)
		{
			stage.addEventListener(KeyboardEvent.KEY_DOWN,keyDwnManejar) ;
			stage.addEventListener(KeyboardEvent.KEY_UP ,keyUpManejar) ;
			stage.addEventListener(MouseEvent.MOUSE_DOWN, mouseDown); 
			stage.addEventListener(MouseEvent.MOUSE_UP, mouseUp); 
			stage.addEventListener(MouseEvent.MOUSE_MOVE,mouseMove);
			stage.addEventListener(MouseEvent.MOUSE_WHEEL,mouseWheel);
		} 	


		private function keyDwnManejar(e:KeyboardEvent):void
		{
			
			switch ( e.keyCode ) 
			{

					case Keyboard.UP:
							Eventos.keyUp 		=	true;
							break;

					case Keyboard.DOWN:
							Eventos.keyDn 		=	true;
							break;

					case Keyboard.LEFT:
							Eventos.keyIz 		=	true;
							break;
					
					case Keyboard.SHIFT:
						Eventos.keySh		=	true;
						break;

					case Keyboard.RIGHT:
							Eventos.keyDe		=	true;
							break;


					case "W".charCodeAt():
							Eventos.keyW		=	true;
							
							break;
					case "A".charCodeAt():
							Eventos.keyA		=	true;
							break;
					case "S".charCodeAt():
							Eventos.keyS		=	true;
							break;
					case "D".charCodeAt():
							Eventos.keyD		=	true;
							break;
					case "Z".charCodeAt():	
							Eventos.keyZ		= 	true;
							break;
					case 49: 
						Eventos.key1 = true;
						break;
					case 50: 
						Eventos.key2 = true;
						break;
					case 51: 
						Eventos.key3 = true;
						break;
					case 52: 
						Eventos.key4 = true;
						break;
					case 53: 
						Eventos.key1 = true;
						break;
					case 54: 
						Eventos.key5 = true;
						break;
					case 55: 
						Eventos.key6 = true;
						break;			
					case 56: 
						Eventos.key7 = true;
						break;			
					case 57: 
						Eventos.key8 = true;
						break;			
			}
		}


		
		private function keyUpManejar(e:KeyboardEvent):void
		{
			
			switch ( e.keyCode ) 
			{

					case Keyboard.UP:
							Eventos.keyUp 		=	false;
							break;

					case Keyboard.DOWN:
							Eventos.keyDn 		=	false;
							break;

					case Keyboard.LEFT:
							Eventos.keyIz 		=	false;
							break;

					case Keyboard.RIGHT:
							Eventos.keyDe		= 	false;
							break;

					case Keyboard.SHIFT:
						Eventos.keySh		=	false;
						break;
					
					case "W".charCodeAt():
							Eventos.keyW		=	false;
							break;
					case "A".charCodeAt():
							Eventos.keyA		=	false;
							break;
					case "S".charCodeAt():
							Eventos.keyS		=	false;
							break;
					case "D".charCodeAt():
							Eventos.keyD		=	false;
							break;
					case "Z".charCodeAt():
							Eventos.keyZ		=	false;
							break;
					
					case 49: 
						Eventos.key1 = false;
						break;
					case 50: 
						Eventos.key2 = false;
						break;
					case 51: 
						Eventos.key3 = false;
						break;
					case 52: 
						Eventos.key4 = false;
						break;
					case 53: 
						Eventos.key5 = false;
						break;
					case 54: 
						Eventos.key6 = false;
						break;
					case 55: 
						Eventos.key7 = false;
						break;			
					case 56: 
						Eventos.key8 = false;
						break;			
			}
		}

		public function mouseDown(e : MouseEvent) : void
		{
			
			Eventos.lastMP = new Point();
			
			Eventos.isMD = true; 
			
			Eventos.lastMP.x = e.target.mouseX; 
			Eventos.lastMP.y = e.target.mouseY; 
			
		}
		
		public function mouseUp(e : MouseEvent) : void
		{
			Eventos.isMD = false; 
			
		}
		public function mouseMove ( e : Event ) : void
		{
			Eventos.msPX = e.target.mouseX;
			Eventos.msPY = e.target.mouseY;
		}
		public function mouseWheel ( e : MouseEvent ) : void
		{
		
			Eventos.msWhl = e.delta;
		}
	}
}