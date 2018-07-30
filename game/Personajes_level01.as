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
	    
	    import game.IParticle;
	    
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
	
	
	public class Personajes_level01 extends DisplayObject3D
	{
		/*
		[Embed (source="assets/personajes/romano_legion_00.png")]
		private var romano00 : Class;
		private var romano00BM : BitmapData;

		[Embed (source="assets/personajes/romano_legion.png")]
		private var romano0f :Class;
		private var romano0fBM : BitmapData;
		
		[Embed (source="assets/personajes/romano_legion_01.png")]
		private var romano01 : Class;
		private var romano01BM : BitmapData;
		
		[Embed (source="assets/personajes/romano_legion_02.png")]
		private var romano02 : Class;
		private var romano02BM : BitmapData;
		
		[Embed (source="assets/personajes/romano_legion_03.png")]
		private var romano03 : Class;
		private var romano03BM : BitmapData;
		
		[Embed (source="assets/personajes/romano_legion_04.png")]
		private var romano04 : Class;
		private var romano04BM : BitmapData;
		
		
		[Embed (source="assets/romano.png")]
		private var romano : Class;
		
		[Embed (source="assets/personajes/julia.png")]
		private var julia :  Class;
		private var juliaBM : BitmapData ;
		
		[Embed (source="assets/personajes/pastor.png")]
		private var pastor :  Class;
		private var pastorBM : BitmapData ;
		
		[Embed (source="assets/miliario.png")]
		private var miliario : Class;
		private var miliarioBM : BitmapData;
		
		[Embed (source="assets/romano_guardia.png")]
		private var rguardia : Class;
		private var rguardiaBM : BitmapData;
		
		[Embed (source="assets/romano_soldado.png")]
		private var rsoldado : Class;
		private var rsoldadoBM : BitmapData;
		
		[Embed (source="assets/romano2.png")]
		private var rsoldado2 : Class;
		private var rsoldado2BM : BitmapData;
		
		[Embed (source="assets/romano3.png")]
		private var rsoldado3 : Class;
		private var rsoldado3BM : BitmapData;
		

		
		[Embed (source="assets/piva3.png")]
		private var piva3 : Class;
		private var piva3BM : BitmapData;
		
		[Embed(source = "assets/camino.dae", mimeType = "application/octet-stream")]
		private var caminoClass:Class;
		private var camino:DisplayObject3D;

		[Embed(source = "assets/calzada.dae", mimeType = "application/octet-stream")]
		private var calzadaClass:Class;
		private var calzada:DisplayObject3D;
		
		
		[Embed(source = "assets/level00.dae", mimeType = "application/octet-stream")]
		private var terrainClass:Class;
		private var terrain:DisplayObject3D;
		
		
		*/
		private var plano:Plane;
		private var edificios:DisplayObject3D;
		
		private var itinerario:Collada;

		public function Personajes_level01()
		{
			init();
			
			var romano_bmp : Bitmap = video.lazy.getBitmap("romano");
			
			var romanoL1:Particles = new Particles(); 
			var h : Number = romano_bmp.height;
			var particlematerial : BitmapParticleMaterial = new BitmapParticleMaterial(romano_bmp.bitmapData,1,1,-h); 
			
			for(var i:Number = 0; i < 11; i++)
			{
				
				var particle : Particle = new Particle(particlematerial,0.2,500+100*i,0,1900);
				
				romanoL1.addParticle(particle);
				
			}
			
			addChild(romanoL1);
			romano_bmp = null;
			
			var romano2_bmp : Bitmap = video.lazy.getBitmap("romano02");
			
			var romanoL2:Particles = new Particles(); 
			var h : Number = romano2_bmp.height;
			var particlematerial : BitmapParticleMaterial = new BitmapParticleMaterial(romano2_bmp.bitmapData,1,1,-h); 
			
			for(var i:Number = 0; i < 11; i++)
			{
				
				var particle : Particle = new Particle(particlematerial,0.2,500+100*i,0,2100);
				
				romanoL2.addParticle(particle);
				
			}
			
			addChild(romanoL2);
			romano_bmp = null;
			
			var romano:IParticle = new IParticle("romano",0);
			addChild(romano);
			romano.z = 1100;
			romano.x = 1100;
			
			
			
			var romano1:IParticle = new IParticle("romano01",0);
			addChild(romano1);
			romano1.z = 1200;
			romano1.x = 1400;
			
			
			var romano2:IParticle = new IParticle("romano02",0);
			addChild(romano2);
			romano2.z = 1200;
			romano2.x = 1430;		
			
			var romano3:IParticle = new IParticle("romano03",0);
			addChild(romano3);
			romano3.z = 1200;
			romano3.x = 1200;
			
			romano3.scale = 0.6;
			//personajes
			//piva2BM = new piva2().bitmapData;	
			//trace(pivaBM);
			/*
			piva3BM  = new piva3().bitmapData;
			var piva :IParticle = new IParticle(piva3BM);
			addChild(piva);
			
			piva2BM  = new rsoldado().bitmapData;
			var piva2:IParticle = new IParticle(piva2BM);
			addChild(piva2);
			piva2.x = 200;
		
			rsoldadoBM = new rsoldado().bitmapData;
			var romano:IParticle = new IParticle(rsoldadoBM);
			addChild(romano);
			romano.z = 200;
			
			rsoldado2BM = new rsoldado2().bitmapData;
			var romano2:IParticle = new IParticle(rsoldado2BM);
			addChild(romano2);
			romano2.z = 200;
			romano2.x = 400;
			
			rsoldado3BM = new rsoldado3().bitmapData;
			var romano3:IParticle = new IParticle(rsoldado3BM);
			addChild(romano3);
			romano3.z = 200;
			romano3.x = 200;
		*/

			
			
			
			var pastorp : IParticle = new IParticle("pastor",11);
			addChild(pastorp);
			pastorp.x = 5000;
			pastorp.z = 400;
			pastorp.y = -50;
			
			
			
			var juliap : IParticle = new IParticle("julia",4);
			addChild(juliap);
			juliap.x =  7000;
			juliap.z =  3000;
			juliap.y = 000;
			
			var romanog0 : IParticle = new IParticle("romano_guardia",2);
			addChild(romanog0);
			romanog0.x =  11600;
			romanog0.z = 17000;
			
			var romanog1 : IParticle = new IParticle("romano_guardia",2);
			addChild(romanog1);
			romanog1.x = 11200;
			romanog1.z = 17000;
			
			var romanog2 : IParticle = new IParticle("romano_guardia",2);
			addChild(romanog2);
			romanog2.x = -2000;
			romanog2.z = 16000;
			
			var romanog3 : IParticle = new IParticle("romano_guardia",2);
			addChild(romanog3);
			romanog3.x = -2800;
			romanog3.z = 16000;
			/*
			romano00BM = new romano00().bitmapData;
			var romano00p : IParticle = new IParticle(romano00BM,5);
			addChild(romano00p);
			romano00p.scale = 2;
		
			romano0fBM = new romano0f().bitmapData;
			var romano0fp : IParticle = new IParticle(romano0fBM,5);
			romano0fp.z = 100;
			

			var particles:Particles = new Particles(); 
			var particles2:Particles = new Particles();
			
			var h  :Number = romano0fBM.height;
			var particle_material : BitmapParticleMaterial = new BitmapParticleMaterial(romano0fBM,1,0,-h); 
			
			for (var j : Number = 0 ; j < 10 ; j++)
			{
			for (var i : Number = 0 ; i < 10 ; i++)
			{
				var particle : Particle = new Particle(particle_material,0.2,0,0,0);
				particle.z = 100 * i;
				particle.x = 100 * j;
				particles.addParticle(particle);  

			}
			}	
			addChild(particles)
	
			romano01BM = new romano01().bitmapData;
			var romano01p : IParticle = new IParticle(romano01BM,5);
			addChild(romano01p);			
			
			romano02BM = new romano02().bitmapData;
			var romano02p : IParticle = new IParticle(romano02BM,5);
			addChild(romano02p);
			
			romano03BM = new romano03().bitmapData;
			var romano03p : IParticle = new IParticle(romano03BM,5);
			addChild(romano03p);
			
			romano04BM = new romano04().bitmapData;
			var romano04p : IParticle = new IParticle(romano04BM,5);
			addChild(romano04p);
			
			romano00p.z = 100;
			romano01p.z = 200;
			romano02p.z = 300;
			romano03p.z = 400;
			romano04p.z = 500;		
			*/
		}


		public function init():void
		{

	
			

	}


		public function update():void
		{
		}                        
	}
}