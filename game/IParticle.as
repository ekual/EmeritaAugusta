package game
{
	
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.Sprite;
	import flash.events.Event;
	
	import org.papervision3d.core.geom.Particles;
	import org.papervision3d.core.geom.renderables.Particle;
	import org.papervision3d.events.InteractiveScene3DEvent;
	import org.papervision3d.materials.BitmapMaterial;
	import org.papervision3d.materials.ColorMaterial;
	import org.papervision3d.materials.special.BitmapParticleMaterial;
	import org.papervision3d.materials.utils.MaterialsList;
	import org.papervision3d.objects.DisplayObject3D;
	import org.papervision3d.objects.parsers.Collada;
	import org.papervision3d.objects.primitives.Cube;
	import org.papervision3d.objects.primitives.Plane;
	
	import utils.DataManager;
	
	/**
	 * Interactividad : particle + cube 
	 * --------------------------------
	 * onRelease Material change
	 * 
	 */
	
	public class IParticle extends DisplayObject3D
	{

		private var _id : Number;
	
		private var _text:String;
	

		
		private var mat:BitmapMaterial;
		
		public function IParticle(text:String,id:Number):void
		{
			
		
				
			this._id =  id;
		
			this._text = text;	
	
			init();
			
			
		}
		
		

	//public function set material_low
		
		public function init():void
		{
			
			
		
			var warp : Sprite = new Sprite();
			var matC : ColorMaterial = new ColorMaterial(0xffffff,0,true);
			var matL : MaterialsList = new MaterialsList();
			matL.addMaterial(matC,"all");

			var cube : Cube = new Cube(matL,60,60,100,1,1,1,0,Cube.TOP+Cube.BOTTOM);
			cube.scale = 2;
			cube.y = 30;
	
			cube.addEventListener(InteractiveScene3DEvent.OBJECT_PRESS, onPlaneClick);
		
		  	addChild(cube);

	
			trace(this._text);
			//particle
			var particleBM : Bitmap = EmeritaAugusta.lazy.getBitmap(this._text);	
		
			
		//	var particleBM : Bitmap = DataManager.getData(this._text);
			var particles:Particles = new Particles(); 
			trace(particleBM);
			var particlematerial : BitmapParticleMaterial = new BitmapParticleMaterial(particleBM.bitmapData,1,1,-particleBM.height);//-(particleBM.height/2)); 
			
			var  particle: Particle = new Particle(particlematerial,0.2,0,00);
			particles.addParticle(particle); 
			
			particleBM = null;
			
			addChild(particles);
			
			
			
		}

		
		private function onPlaneClick(evt:InteractiveScene3DEvent):void 
		{
			Eventos.activo = this._id;	
			trace("PRESS2"+this._id);
		}
	}	
}