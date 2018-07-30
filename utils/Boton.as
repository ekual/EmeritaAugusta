package utils
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	/*
	
	La clase boton solo debe contener la interfaze para interactuar
	
	
	
	*/
	public class Boton extends Sprite
	{
		private var _sprite:Sprite;
		private var frase : Texto;
		private var string : String;
		private var id : Number ;
		public var pulsado : Boolean;
		
		public function Boton()
		{
			string = new String();
			id = new Number();
			
			_sprite = new Sprite();
			_sprite.width = 200;
			_sprite.height = 60;
			
			frase = new Texto("",1,280,70);
			addChild(frase);
			
	//		this.addEventListener(MouseEvent.CLICK,siguiente);´
	
			addEventListener(MouseEvent.CLICK,pulsar);
		}
		public function setId(ida:int):void
		{
			this.id = ida;
		}
		public function setX(xo : int ):void
		{
			this.x = xo;
		}
		public function setY(yo : int ):void
		{
			this.y = yo;
		}
		public function setTexto(str:String):void
		{
			this.frase.escribir(str);
			this.string = str;
		}
		

		private function pulsar( evt : MouseEvent ):void
		{
			this.pulsado = true;
			Eventos.activo = this.id;
			this.removeChild(frase);
			
		}
	}
}