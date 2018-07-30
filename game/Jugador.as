package game
{
	import flash.filters.BlurFilter;
	
	import org.papervision3d.materials.BitmapFileMaterial;
	import org.papervision3d.materials.ColorMaterial;
	import org.papervision3d.materials.WireframeMaterial;
	import org.papervision3d.materials.utils.MaterialsList;
	import org.papervision3d.objects.DisplayObject3D;
	import org.papervision3d.objects.primitives.Cube;
	import org.papervision3d.objects.primitives.Plane;
	
	public class Jugador extends DisplayObject3D
	{
		private var plano:Plane;
		private var velMax:Number = 0;
		private var vel:Number = 0;
		private var giroMax:Number = 0;
		private var giro:Number = 0;
		private var der:Number = 0;
		
		//private var y : Number;
		public function Jugador()
		{
			init();
			this.y = 100;			
		}
		
		private function init():void
		{
			var plano_mat:BitmapFileMaterial=new BitmapFileMaterial("assets/piva.png");
			
			plano=new Plane(plano_mat,100,310,1,1);
		

			plano.material.doubleSided	=	true;
			addChild(plano);
			plano.y = -100;
			
			
			//z = 300;
			
			/*
			var edif_mat:WireframeMaterial = new WireframeMaterial();
			var edif_mlist:MaterialsList = new MaterialsList();
			edif_mlist.addMaterial(edif_mat,"all");
			var cubo : Cube = new Cube(edif_mlist,100,100,240);
			addChild(cubo);
			*/
		
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

		public function update():void
		{
	
			/*
				if (Eventos.keyUp) { velMax = 50; }
				else if(Eventos.keyDn) { velMax = -30; }
				else { velMax = 0; }
				
				vel -= ( vel - velMax ) * 0.1;
				moveForward(vel*6);
				
			*/
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
				}
		
				this.localRotationY += giroMax * 2;
				
				/*
				//giro -= ( giro - giroMax) * 0.1;
				//yaw(vel * giro * 0.01);
				plano.localRotationZ = giro * 0.2;
				this.localRotationY += giroMax * 0.2;
				//plano.rotationY += giroMax * 0.2;
				//yaw(giroMax * 0.2);
				
				// movimiento lateral A - D
				der = 0 ;
				if (Eventos.keyA) { der = -20;}
				else if(Eventos.keyD) { der = 20;}
				moveRight(der * 10);
				//MIRAR A LA DERECHA // this.x += der;
				
				//trace("MX:" + Eventos.msPX + " MY:" + Eventos.msPY);
				//trace("x:" + this.x + " z:" + this.z );
				//trace ( "pos: X:" + this.x + " Z:" + this.z ); 
				*/

		}
		
		
	}
}
