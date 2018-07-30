package game
{
	    import flash.display.Bitmap;
	    import flash.display.BitmapData;
	    import flash.display.DisplayObject;
	    import flash.display.InteractiveObject;
	    import flash.display.Loader;
	    import flash.display.MovieClip;
	    import flash.display.Sprite;
	    import flash.events.MouseEvent;
	    import flash.net.URLRequest;
	    
	    import org.papervision3d.core.effects.utils.BitmapClearMode;
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
	    

	
	public class PlaneL extends DisplayObject3D
	{

	
	//	[Embed(source = "assets/manzana00.dae", mimeType = "application/octet-stream")]
		private var jthmClass:Class;
		private var jthm:DisplayObject3D;
		
		
		
		private var plano:Plane;
		private var edificios:DisplayObject3D;
		
		private var itinerario:Collada;

	
			private var plane:Plane;
			
		public function PlaneL()
		{
			init();
		}
		

		
		public function init():void
		{

			//var plane_mat : BitmapFileMaterial = new BitmapFileMaterial("assets/plano_low.jpg",true);
			
			var plane_mat : BitmapFileMaterial = new BitmapFileMaterial("assets/sb_f_l00.png",false);
		
			/*
			clouds	 = new FastClouds();
		//	var cloud_data : BitmapData = new BitmapData(500,380);
		//	cloud_data = clouds.getClouds();
			
			var cloud_mc : MovieClip = clouds.getMc();
		//	var plane_mat :BitmapMaterial = new BitmapMaterial(cloud_data);
			var plane_mat :MovieMaterial = new MovieMaterial(cloud_mc);
			
		//	jthm = new Collada(XML(new jthmClass()));
			
			var plane : Plane = new Plane(plane_mat,10000,10000,10,10);
			var do3d : DisplayObject3D = new DisplayObject3D();
		//	do3d = getColladaDisplayObj(jthm);
		//	
		///	do3d.scale = 10;
		//	do3d.y = -10;
	
	//		plane.localRotationX = -90;
				*/
			plane = new Plane(plane_mat,1117,115,10,2);
	
			plane.scale = 40;
			plane.y = 3000;
			plane.x = 1500;
			addChild(plane); 

		
	}


		public function update():void
		{
		}                        
	}
}