package game
{
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.display.Sprite;
	
	import org.papervision3d.core.proto.CameraObject3D;
	
		public class CameraController
		{
			private var camara:CameraObject3D;
			private var jugador	:Jugador;
			private var up:Number = 0;
			private var upm:Number = 0;
			private var pan:Number = 0;
			
		
		public function CameraController(camera3D:CameraObject3D, jugador3D:Jugador)
		{
			camara	=camera3D;
			jugador	=jugador3D;
			init();
		}
		
		public function init():void
		{
			
			/*
			camara.z = -150000;
			camara.y = 00;
			
			camara.far	=	200000;
			*/

			camara.focus	=	17;
			camara.target	=	jugador;
			

			//camara.useCulling = false;
		
			//camara.useClipping = false;
	
			
		}
		
		public function update():void
		{
			camara.copyTransform(jugador);
		//	camara.
			
			jugador.visible		=	true;
			//camara.moveUp(10);
		
		
			
			
		}
	}
}