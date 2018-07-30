package game
{
	
	import flash.display.BitmapData;
	import flash.display.DisplayObject;
	import flash.display.Scene;
	import flash.display.Sprite;
	import flash.display.Stage;
	import flash.events.Event;
	import flash.events.IEventDispatcher;
	import flash.events.IOErrorEvent;
	import flash.events.ProgressEvent;
	import flash.events.SecurityErrorEvent;
	import flash.filters.*;
	import flash.geom.Vector3D;
	import flash.media.Camera;
	import flash.media.Sound;
	import flash.media.SoundChannel;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	import flash.xml.XMLDocument;
	
	import game.ColMapa;
	
	import org.papervision3d.cameras.*;
	import org.papervision3d.core.clipping.FrustumClipping;
	import org.papervision3d.core.math.Number3D;
	import org.papervision3d.core.render.filter.FogFilter;
	import org.papervision3d.materials.BitmapFileMaterial;
	import org.papervision3d.materials.ColorMaterial;
	import org.papervision3d.materials.WireframeMaterial;
	import org.papervision3d.materials.special.FogMaterial;
	import org.papervision3d.materials.utils.MaterialsList;
	import org.papervision3d.objects.DisplayObject3D;
	import org.papervision3d.objects.parsers.Collada;
	import org.papervision3d.objects.primitives.Cone;
	import org.papervision3d.objects.primitives.Cube;
	import org.papervision3d.objects.primitives.Cylinder;
	import org.papervision3d.objects.primitives.Plane;
	import org.papervision3d.objects.special.Sound3D;
	import org.papervision3d.render.BasicRenderEngine;
	import org.papervision3d.render.QuadrantRenderEngine;
	import org.papervision3d.scenes.Scene3D;
	import org.papervision3d.view.BasicView;
	import org.papervision3d.view.Viewport3D;
	import org.papervision3d.view.stats.StatsView;
	
	import utils.Colision;
	import utils.DataManager;

	public class L00 extends Sprite
	{

		[Embed(source = "assets/level00/level_base.dae", mimeType = "application/octet-stream")]
		private var terrainClass:Class;

		//[Embed(source = "assets/level00/level00_calzada.dae", mimeType = "application/octet-stream")]
	//	private var calzadaClass:Class;
		
		[Embed(source = "assets/level00/miliario.dae", mimeType = "application/octet-stream")]
		private var miliarioClass:Class;
	
		
		
		[Embed(source = "assets/level00/encina_tronco.dae", mimeType = "application/octet-stream")]
		private var encinatClass:Class;
		
		[Embed(source = "assets/level00/encina_copa.dae", mimeType = "application/octet-stream")]
		private var encinacClass:Class;
		
		
		
		private var viewport:Viewport3D;
		private var viewport2 : Viewport3D;
		private var viewport3 : Viewport3D;

		private var viewport4 : Viewport3D;
		
		
		private var scene:Scene3D;
		private var scene2:Scene3D;
		private var scene3:Scene3D;
		
		private var scene4:Scene3D;
		
		private var camera:Camera3D;
		private var camera4:Camera3D;

		private var renderer:QuadrantRenderEngine;
		
		private var render1:BasicRenderEngine;
		private var render2:BasicRenderEngine;
		private var render3:BasicRenderEngine;		
	
		
		private var jugador:Jugador;
		//collision
		private var dummy:Dummy;
		private var mapa:ColMapa;

		private var people : Personajes_level00;
		private var particles : Level00_par;
		
		private var tumba:IParticle;
		
	
		private var channel:SoundChannel;
		private var sound3d:Sound3D;
		private var sound:Sound;
		
		//private var sky:SkyBoxes;
		private var plane:PlaneL;
		
	//	private var terrain : Collada;
//		private var camino : Collada;
		private var terrain :IObject;
		
		private var do3d:DisplayObject3D;
		
		private var dof:Plane;
		
		private var colision:Colision;
		
		
		public function L00()
		{
			init();
		}
		private function init()
		{

			
			viewport = new Viewport3D(1300,500,false,true,true,false);
			viewport.interactive = true;
			
			viewport2 = new Viewport3D(1300,500,false,false,false,false);
			viewport3 = new Viewport3D(1300,500,false,false,false,false);
	

		
			
			addChild(viewport2);	

	
			addChild(viewport3);
			
			addChild(viewport);
			scene = new Scene3D();
			scene2 = new Scene3D();
			scene3 = new Scene3D();
		
	
			//SOUNDS
			channel = new SoundChannel();
			sound = new Sound();
			sound = DataManager.getData("epitafio");
			
			sound3d = new Sound3D(sound);
			sound3d.maxSoundDistance = 10000;
			sound3d.position = new Number3D(4000,10,4000);
			
			sound3d.play(0,4);
			scene.addChild(sound3d);
			
			
			
			// SKYBOXES
		//	var material : BitmapFileMaterial = new BitmapFileMaterial("assets/nubes.jpg",false);
			
			var material_e : BitmapFileMaterial = new BitmapFileMaterial("assets/skybox_e.jpg",false);
			var material_o : BitmapFileMaterial = new BitmapFileMaterial("assets/skybox_o.jpg",false);
			var material_n : BitmapFileMaterial = new BitmapFileMaterial("assets/skybox_n.jpg",false);
			var material_s : BitmapFileMaterial = new BitmapFileMaterial("assets/skybox_s.jpg",false);
		
			material_e.doubleSided = true;
			material_s.doubleSided = true;
			material_o.doubleSided = true;
			material_n.doubleSided = true;
			
			var ml:MaterialsList = new MaterialsList();  
			
			ml.addMaterial(material_e, "left");
			ml.addMaterial(material_n, "back");
			ml.addMaterial(material_o, "right");
	
			ml.addMaterial(material_s, "front");
			
			var cube : Cube = new Cube(ml,100,100,40,3,3,3,Cube.TOP+Cube.BOTTOM);//,Cube.TOP+Cube.BOTTOM
			
		
			//scene3.addChild(cube);

					
		
			cube.y  = 18000;
			cube.scale = 10;
		

			//sky = new SkyBoxes();
			//scene3.addChild(sky);
			
		/*	
			plane = new PlaneL();
			scene3.addChild(plane);
			plane.z = 30000;
			plane.x = 6000;
			plane.y = -1000;
			*/
			
							
			/*
			var camino : DObject = new DObject(caminoClass,"assets/level00/terrainA.jpg");
			scene.addChild(camino);
			camino.y = 0;
			
			*/
		//	var calzada : DObject = new DObject(calzadaClass,"assets/level00/calzada_corduba.png");
		//	scene.addChild(calzada);

			
			var encinac : DObject = new DObject(encinacClass,"assets/level00/encina_copa.jpg");
			scene.addChild(encinac);
			
			var encinat : DObject = new DObject(encinatClass,"assets/level00/encina.png");
			scene.addChild(encinat);
			
			//terrain
/*
			var terrain : IObject = new IObject(terrainClass,"assets/level00.jpg",0);
			scene.addChild(terrain);
			terrain.y = -220;
			terrain.scale = 100;
			*/
			var terrain : DObject = new DObject(terrainClass,"assets/level00/TERRAIN00l.jpg",0);
			scene.addChild(terrain);
		
		//	terrain.scale = 10;
			
			colision = new Colision(terrain.do3D);
		//	colision.getFace(new Number3D());
			
			
			
		//f	colision.drawAllFaces();
		
		//	scene.addChild(colision);
			colision.drawFace(1);
			
			trace("colision added!");
			
			var encina01 : Collada = new Collada("assets/encina01.dae");
			scene.addChild(encina01);
			encina01.scale = 0.1;
			encina01.x = 122;
			encina01.z = 74;
			encina01.y = -200;
	
			
			var miliario : IObject = new IObject(miliarioClass,"assets/level00/milirario_texture.png",41);
			scene.addChild(miliario);
	
		//	mapa = new ColMapa("mapa00");
			//addChild(mapa);
			
		//	mapa.scaleX = 0.4;
		//	mapa.scaleY = 0.4;
			
		//	mapa.addEventListener
				
				
			dummy = new Dummy();
			scene.addChild(dummy);
		
			dummy.y =00;
			jugador =	new	Jugador();
			scene.addChild( jugador );

				jugador.y = 00;
			// pos ini
			dummy.setX(00);
			dummy.setZ(00);
			jugador.setZ(00);
			jugador.setX(00);
			jugador.y = 100;
			/*
			dummy.setZ(1000);
			dummy.setX(1000);
			
			jugador.setZ(1000);
			jugador.setX(1000);
			*/
			
			/*	P E O P L E */
			people = new Personajes_level00();
			scene.addChild(people);
		
			particles = new Level00_par();
			scene.addChild(particles);
			particles.scale = 0.2;
			
			/**
			 * 
			 * 	C A M E R A
			 * 
			 **/
		
			camera = new Camera3D();

			camera.target = jugador;

			camera.focus = 24;
			//camera.zoom = 200;
			//camera.useCulling = true;
			/*
			camera4 = new Camera3D();
			camera4.target = jugador;
			camera4.focus = 18;
			*/			
					   
			//renderer = new QuadrantRenderEngine(QuadrantRenderEngine.ALL_FILTERS);
			
			render1 = new BasicRenderEngine();
			render2 = new BasicRenderEngine();			
			render3 = new BasicRenderEngine();		
			//render4 = new BasicRenderEngine();
			//renderer.clipping = new FrustumClipping(FrustumClipping.NEAR); 
			
			
			beginRender();

			var s : StatsView = new StatsView(renderer);
			addChild(s);
		
			
			jugador.visible		=	false;
		}

		private function beginRender():void
		{
			this.addEventListener(Event.ENTER_FRAME,render);
		}
		
		private function render(e:Event):void
		{
			if ( Eventos.activo == 0 ) {
			dummy.update();
			//jugador.update();
			
		//	mapa.update();
			//sound3D.updateSound(camera);
			
			//jugador.copyPosition(dummy);
			
			
			/* checkCollision */
			var pos :Number3D = new Number3D();
			pos =  dummy.getPos();
	
			
			//if (this.mapa.check(pos)){}
			//{
			//jugador.copyPosition(dummy);
			//}else{	dummy.copyPosition(jugador);}
			
			dummy.update();
			//	cameraS.copyPosition(dummy);

			camera.copyTransform(dummy);
			camera.moveBackward(10);
		//	var n : Number = this.colision.getFace(pos);
			//colision.drawFace(n);
			
		//	dummy.y = this.colision.getY(n);
		//	trace("Y:"+dummy.y);
			//if (this.mapa.check(pos))

			
			//}else { dummy.copyPosition(jugador); }
			
			
			//sound3d.updateSound(camera);
			
			camera.copyTransform(jugador);

			camera.moveBackward(300);
		
			

		//camera.zoom = 60;

		//	camera.moveUp(0);
		//	camera.rotationX = 66;
		//  world.update();		
			//	camera.moveUp(0);
			jugador.y = 90;
			dummy.y = 90;
			camera.moveBackward(-100);
			camera.moveUp(30);
			//	camera.rotationX = 66;
			//  world.update();		
			camera.fov = Eventos.fov;
		//	renderer.renderScene(scene3,camera,viewport3);

			render1.renderScene( scene  , camera , viewport  );
			render2.renderScene( scene2 , camera , viewport2 );
			render3.renderScene( scene3 , camera , viewport3 );
		//	render4.renderScene( scene4, camera4,viewport4);
			}else{ sound3d.stop(); }
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