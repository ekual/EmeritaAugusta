package game
{
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.DisplayObject;
	import flash.display.InteractiveObject;
	import flash.display.Loader;
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.net.URLRequest;
	
	import org.papervision3d.core.geom.Particles;
	import org.papervision3d.core.geom.renderables.Particle;
	import org.papervision3d.core.geom.renderables.Vertex3D;
	import org.papervision3d.core.math.Number3D;
	import org.papervision3d.core.proto.*;
	import org.papervision3d.events.FileLoadEvent;
	import org.papervision3d.events.InteractiveScene3DEvent;
	import org.papervision3d.materials.BitmapFileMaterial;
	import org.papervision3d.materials.BitmapMaterial;
	import org.papervision3d.materials.ColorMaterial;
	import org.papervision3d.materials.MovieMaterial;
	import org.papervision3d.materials.WireframeMaterial;
	import org.papervision3d.materials.special.BitmapParticleMaterial;
	import org.papervision3d.materials.special.MovieParticleMaterial;
	import org.papervision3d.materials.special.ParticleBitmap;
	import org.papervision3d.materials.special.ParticleMaterial;
	import org.papervision3d.materials.utils.MaterialsList;
	import org.papervision3d.objects.DisplayObject3D;
	import org.papervision3d.objects.parsers.Collada;
	import org.papervision3d.objects.primitives.Cube;
	import org.papervision3d.objects.primitives.Plane;
	import org.papervision3d.view.Viewport3D;
	
	import utils.DataManager;
	
	
	public class Level00_par extends DisplayObject3D
	{
		[Embed(source = "assets/level00/par_encinas.dae", mimeType = "application/octet-stream")]
		private var encinasClass:Class;
		
		[Embed(source = "assets/level00/par_cipreses.dae", mimeType = "application/octet-stream")]
		private var cipresesClass:Class;
		
			
		public function Level00_par()
		{
			init();
		}
		

		
		public function init():void
		{
			
			
			
			
			
			
			
			//	var particle : Particle = new Particle(particleMaterial, particleSize, xpos, ypos, zpos);

		
			// E N C I N A S
			//bmp = null;
			
			var colada = new Collada(XML(new encinasClass()));
			
			var mesh : DisplayObject3D = new DisplayObject3D();
			
			mesh = getColladaDisplayObj(colada);
			
			//trace("M"+mesh.geometry.vertices.length);
			
			//for
			var avertices : Array = mesh.geometry.vertices;


			
			
			var encina_bmp : Bitmap = EmeritaAugusta.lazy.getBitmap("encina");
		
			trace(encina_bmp);
		
			var encinar:Particles = new Particles(); 
			var encinaparticlematerial : BitmapParticleMaterial = new BitmapParticleMaterial(encina_bmp.bitmapData,1,1,-encina_bmp.height); 
			
			var zpe : Number = 1;
			//var encina_p : Particle = new Particle(encinaparticlematerial,6,0,0,0);
		//	encinar.addParticle(encina_p); 
	
			
			for each(var v:Vertex3D in avertices) {
	
				var encina_pa : Particle = new Particle(encinaparticlematerial,1.4,v.x*10,v.y,v.z*10);
				encinar.addParticle(encina_pa); 

			}
			
			addChild(encinar);
			
			/// CIPRESES
			
			
			
			
			

			
			colada = null;
			colada = new Collada(XML(new cipresesClass()));
			mesh=null;
			mesh =  getColladaDisplayObj(colada);
			avertices = null;
			avertices = mesh.geometry.vertices;
			
			var cipres_bmp : Bitmap = EmeritaAugusta.lazy.getBitmap("cipres");
			
			var cipreses:Particles = new Particles(); 
			var h : Number = cipres_bmp.height;
			var particlematerial : BitmapParticleMaterial = new BitmapParticleMaterial(cipres_bmp.bitmapData,1,1,-h); 
			
			for each(var v:Vertex3D in avertices) {
				
				var particle : Particle = new Particle(particlematerial,0.2,v.x*10,-100,v.z*10);
				
				cipreses.addParticle(particle);
				
			}
			
		
			addChild(cipreses);
			
		}
		public function getColladaDisplayObj(tempCO:DisplayObject3D):DisplayObject3D {
			var returnObj:DisplayObject3D;
			
			try {
				var childname:String = String(tempCO.childrenList()).substring(0,String(tempCO.childrenList()).indexOf(": "));
				
				returnObj = tempCO.getChildByName(childname);
				
				trace("found colladaNode: " + childname);
			} catch(errObject:Error) {
				trace(errObject.message);
			}
			
			return returnObj;
		}
	}
}


