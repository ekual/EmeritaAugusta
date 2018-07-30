package game
{
	import game.ColMapa;
	
	import org.papervision3d.core.math.Number3D;
	import org.papervision3d.materials.BitmapFileMaterial;
	import org.papervision3d.materials.WireframeMaterial;
	import org.papervision3d.materials.utils.MaterialsList;
	import org.papervision3d.objects.DisplayObject3D;
	import org.papervision3d.objects.primitives.Cube;
	import org.papervision3d.objects.primitives.Cylinder;
	import org.papervision3d.objects.primitives.Plane;
	
	public class Dummy extends DisplayObject3D
	{
		private var mapa :ColMapa;
		private var cylinder:Cylinder;
		private var velMax:Number = 0;
		private var vel:Number = 0;
		private var giroMax:Number = 0;
		private var giro:Number = 0;
		private var der:Number = 0;
		private var up:Number = 0;
		
		public static var pos :Array;
		
		public function Dummy(imapa:ColMapa=null)
		{
			
			this.mapa = imapa;
			init();
		}
		
		private function init():void
		{
			pos = new Array();
			
			cylinder = new Cylinder(new WireframeMaterial(),10,10,5,2,-1,false,false);
			cylinder.alpha = 0;
			addChild(cylinder);
			//cylinder.y = -100;
		
		
		}
		
		public function rot(rot:Number):void
		{
			this.localRotationY = rot;
		}
		public function getX():Number
		{
			return this.x;
		}
		public function getZ():Number
		{
			return this.z;
		}
		public function setX(xo:int):void
		{
			//xo = ( xo  ) * 1000; 
			this.x = xo;
		}
		public function setY(yo:int):void
		{
			//yo = yo * 1000;
			this.y = yo;
		}
		public function setZ(zo:int):void
		{
			//yo = yo * 1000;
			this.z = zo;
		}
		public function checkPosition(position:Number3D)
		{
				return mapa.check(position);
		}
		public function getPos():Number3D
		{
			return this.position;
		}
		public function getPosn(n:Number):Number
		{
			return Dummy.pos[n];
		}
		public function update():void
		{
			//	this.setX(xo);
			//	this.setY(yo);
			//	this.setZ(zo)
/*
			if (Eventos.keyUp) { velMax = 3; }
			else if(Eventos.keyDn) { velMax = -2; }
	*/
			if (Eventos.keyW) { velMax = 3; }
			else if(Eventos.keyS) { velMax = -2; }
			else { velMax = 0; }
			
			if (Eventos.keySh ) { velMax *= 10;}
			
			vel -= ( vel - velMax ) * 0.8;
	
			
			moveForward(vel);
			//this.z += vel;
			
			
			if (Eventos.keyDe)
			{
				if (giroMax < 30) { giroMax = -3; }
				
			}else if (Eventos.keyIz)
			{
				if(giroMax > -30) { giroMax = 3; }
			}
			else
			{
				giroMax -= giroMax * 0.1;
				giroMax = 0;
				vel = 0;
			}
			
			this.localRotationY += giroMax * 1;
		
			der = 0 ;
			if (Eventos.keyA) { der = -2;}
			else if(Eventos.keyD) { der = 2;}
			moveRight(der * 10);
			up = 0;
			if (Eventos.isMD)
			{
				trace(Eventos.msPX + "Y:"+Eventos.msPY);
			}
			
			if(Eventos.keyUp) { up = 2;}
			if(Eventos.keyDn){up = -2;}
			
			moveUp(up);
			
			
			var n : Number3D = new Number3D();
			n = this.position;
			pos.push(n);
		
			if (pos.length > 4) {pos.shift()}
			//trace("n"+pos[pos.length-1] + ":::" + pos[0]);
			

			}
		
		
	}
}
