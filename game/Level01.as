package game
{
	
	import flash.display.DisplayObject;
	import flash.display.Sprite;
	import flash.display.Stage;
	import flash.events.Event;
	import flash.events.IEventDispatcher;
	import flash.events.IOErrorEvent;
	import flash.events.ProgressEvent;
	import flash.events.SecurityErrorEvent;
	import flash.geom.Vector3D;
	import flash.media.Sound;
	import flash.media.SoundChannel;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	import flash.xml.XMLDocument;
	
	import game.*;
	
	import org.papervision3d.cameras.*;
	import org.papervision3d.core.clipping.FrustumClipping;
	import org.papervision3d.core.math.Number3D;
	import org.papervision3d.materials.BitmapFileMaterial;
	import org.papervision3d.materials.ColorMaterial;
	import org.papervision3d.materials.WireframeMaterial;
	import org.papervision3d.materials.special.FogMaterial;
	import org.papervision3d.materials.utils.MaterialsList;
	import org.papervision3d.objects.DisplayObject3D;
	import org.papervision3d.objects.parsers.Collada;
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
	
	import prueba.Lira;
	

	public class Level01 extends Sprite
	{
		
		[Embed(source = "assets/level01/terrain.dae", mimeType = "application/octet-stream")]
		private var terrainClass:Class;
		
		//[Embed(source = "assets/level00/level00_calzada.dae", mimeType = "application/octet-stream")]
		//	private var calzadaClass:Class;

		[Embed(source = "assets/level00/casa_mitreo.dae", mimeType = "application/octet-stream")]
		private var casaClass:Class;
		
		
		[Embed(source = "assets/level01/cipreses.dae", mimeType = "application/octet-stream")]
		private var cipresesClass:Class;
		
		[Embed(source = "assets/level01/encinas.dae", mimeType = "application/octet-stream")]
		private var encinasClass:Class;
		
	
		[Embed(source = "assets/level01/chopera.dae", mimeType = "application/octet-stream")]
		private var choperaClass:Class;	
	
		
		[Embed(source = "assets/level01/estela00.dae", mimeType = "application/octet-stream")]
		private var estela00Class:Class;			
	
		[Embed(source = "assets/level01/estela01.dae", mimeType = "application/octet-stream")]
		private var estela01Class:Class;			
		
		[Embed(source = "assets/level01/estela02.dae", mimeType = "application/octet-stream")]
		private var estela02Class:Class;		
		
		[Embed(source = "assets/level01/estela_lup.dae", mimeType = "application/octet-stream")]
		private var estela_lupClass:Class;		
		
		[Embed(source = "assets/level01/estela_toga.dae", mimeType = "application/octet-stream")]
		private var estela_togaClass:Class;		
		
		[Embed(source = "assets/level01/estela_mat.dae", mimeType = "application/octet-stream")]
		private var estela_matClass:Class;		
		
		[Embed(source = "assets/level01/estela.dae", mimeType = "application/octet-stream")]
		private var estela03Class:Class;		
		
		
		[Embed(source = "assets/level01/ara00.dae", mimeType = "application/octet-stream")]
		private var ara00Class:Class;		
		
		[Embed(source = "assets/level01/julios.dae", mimeType = "application/octet-stream")]
		private var juliosClass:Class;	
		
		[Embed(source = "assets/level01/vocconios.dae", mimeType = "application/octet-stream")]
		private var vocconiosClass:Class;			
		
		
		[Embed(source = "assets/level01/cuppaes.dae", mimeType = "application/octet-stream")]
		private var cuppaesClass:Class;			
		

		
		
		
		[Embed(source = "assets/level01/terrain03.dae", mimeType = "application/octet-stream")]
		private var terrain03Class:Class;			
		
		[Embed(source = "assets/level01/terrain00.dae", mimeType = "application/octet-stream")]
		private var terrain00Class:Class;	
		
		[Embed(source = "assets/level01/terrain01.dae", mimeType = "application/octet-stream")]
		private var terrain01Class:Class;			
			
		
		[Embed(source = "assets/level01/torreon.dae", mimeType = "application/octet-stream")]
		private var torreonClass:Class;			

		[Embed(source = "assets/level01/torres.dae", mimeType = "application/octet-stream")]
		private var torresClass:Class;	
		
		[Embed(source = "assets/level01/muralla00.dae", mimeType = "application/octet-stream")]
		private var muralla00Class:Class;			
		
		[Embed(source = "assets/level01/muralla01.dae", mimeType = "application/octet-stream")]
		private var muralla01Class:Class;			
		
		[Embed(source = "assets/level01/muralla02.dae", mimeType = "application/octet-stream")]
		private var muralla02Class:Class;			
		
		[Embed(source = "assets/level01/puerta_columbarios.dae", mimeType = "application/octet-stream")]
		private var puerta_columbariosClass:Class;			
		
		[Embed(source = "assets/level01/puerta_mitreo.dae", mimeType = "application/octet-stream")]
		private var puerta_mitreoClass:Class;		
		
		
		[Embed(source = "assets/level00/backE.dae", mimeType = "application/octet-stream")]
		private var backEClass:Class;			
		
		
		[Embed(source = "assets/level00/backS.dae", mimeType = "application/octet-stream")]
		private var backSClass:Class;	
		
		[Embed(source = "assets/level00/backO.dae", mimeType = "application/octet-stream")]
		private var backOClass:Class;	
		
		public var camera:Camera3D;
		public var cameraS:SpringCamera3D;
		
		public var viewport:Viewport3D;
		public var viewport2:Viewport3D;
		public var viewport3:Viewport3D;
		
		public var renderer:BasicRenderEngine;
		public var render2:BasicRenderEngine;
		public var render3:BasicRenderEngine;
		
		public var scene:Scene3D;
		public var scene2:Scene3D;
		public var scene3:Scene3D;
		
		//collision
		private var dummy:Dummy;
		private var dummy_ant:Dummy;
		private var people : Personajes_level00;
		private var particles : Level00_par;
		
		private var mapa:ColMapa;
		
		private var rotX:Number = 0.3;
		private var rotY:Number = 0.3;
		private var camPitch:Number = 90;
		private var camYaw:Number = 270;
		
		
		private var channel:SoundChannel;
		private var sound3d:Sound3D;
		private var sound:Sound;
		
		
		
		
		public function Level01() 
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
			sound = EmeritaAugusta.lazy.getSound("epitafio");
			
			sound3d = new Sound3D(sound);
			sound3d.maxSoundDistance = 10000;
			sound3d.position = new Number3D(4000,10,4000);
			
			sound3d.play(0,4);
			scene.addChild(sound3d);
			
			//terrain
			/*
			var terrain : IObject = new IObject(terrainClass,"assets/level00.jpg",0);
			scene.addChild(terrain);
			terrain.y = -220;
			terrain.scale = 100;
			*/
			var chopera:DObject = new DObject(choperaClass,"assets/level01/arboleda.png",0);
			scene3.addChild(chopera);
			
			var cipreses:DObject = new DObject(cipresesClass,"assets/level01/cipres01.png",0);
			scene.addChild(cipreses);
			cipreses.setDouble();
			
			var encinas:DObject = new DObject(encinasClass,"assets/level01/encina.png",0);
			scene.addChild(encinas);
			
			var torreon:DObject = new DObject(torreonClass,"assets/level01/muralla_tile.png",0);
			scene3.addChild(torreon);
			
			var torres:DObject = new DObject(torresClass,"assets/level01/murallas_torre_front.png",0);
			scene3.addChild(torres);
			
			var puerta_columbarios:DObject = new DObject(puerta_columbariosClass,"assets/level01/puerta_columbarios.png",0);
			scene3.addChild(puerta_columbarios);
			
			var puerta_mitreo:DObject = new DObject(puerta_mitreoClass,"assets/level01/puerta_mitreo.png",0);
			scene3.addChild(puerta_mitreo);			
		//	var muralla:DObject = new DObject(murallaClass,"assets/level01/muralla_tile.png",0);
		//	scene.addChild(muralla);	
			
			var terrain : DObject = new DObject(terrainClass,"assets/level01/TERRAIN01.jpg",0);
			scene.addChild(terrain);
			
			var loadA :Array = new Array(estela00Class,estela01Class,ara00Class,estela03Class,estela_matClass);
			
			var mat:BitmapFileMaterial = new BitmapFileMaterial("assets/level01/Columbarios_tumbas.jpg");
			
			for(var i:Number = 0; i< loadA.length-1;i++)
			{
				var estelax:DObjectm = new DObjectm(loadA[i],mat,0);
				scene.addChild(estelax);
			}
			
			
			loadA = null;
		    loadA = new Array(muralla00Class,muralla01Class,muralla02Class);
			
			mat = null;
			mat  = new BitmapFileMaterial("assets/level01/muralla_tile.png"); 
			
			var mat:BitmapFileMaterial = new BitmapFileMaterial("assets/level01/muralla_tile.png");
			
			for(var i:Number = 0; i< loadA.length-1;i++)
			{
				var murallax:DObjectm = new DObjectm(loadA[i],mat,0);
				scene.addChild(murallax);
			}
			
			
			var cuppaes : DObject = new DObject(cuppaesClass,"assets/level01/cuppae_t.png");
			scene.addChild(cuppaes);
			
			
			var estela02:DObject = new DObject(estela02Class,"assets/level01/estela00.png");
			scene.addChild(estela02);
			
			var terrain : DObject = new DObject(terrainClass,"assets/level01/TERRAIN01.jpg",0);
			scene.addChild(terrain);
			/*
			var terrain00 : DObject = new DObject(terrain00Class,"assets/level01/level01.jpg",0);
			scene.addChild(terrain00);
			
			var terrain01 : DObject = new DObject(terrain01Class,"assets/level01/level01.jpg",0);
			scene.addChild(terrain01);
			
			var terrain_ext : DObject = new DObject(terrain03Class,"assets/level01/level01.jpg",0);
			scene.addChild(terrain_ext);

			
			
			var camino00 : DObject = new DObject(camino00Class,"assets/level01/camino01.jpg",0);
			scene.addChild(camino00);
			
			var camino01 : DObject = new DObject(camino01Class,"assets/level01/level01.jpg",0);
			scene.addChild(camino01);
			
			var camino02 : DObject = new DObject(camino02Class,"assets/level01/camino01.jpg",0);
			scene.addChild(camino02);
			*/
			var vocconios:DObject = new DObject(vocconiosClass,"assets/level01/vocconios.png",0);
			scene.addChild(vocconios);
			
			var julios:DObject = new DObject(juliosClass,"assets/level01/julios.png",0);
			scene.addChild(julios);			
			
			var casa : DObject = new DObject(casaClass,"assets/level00/mitreo_textured.jpg",0);
			scene.addChild(casa);
			//	terrain.scale = 10;
			
			//colision = new Colision(terrain.do3D);
			//	colision.getFace(new Number3D());
			
			
			var backE : DObject = new DObject(backEClass,"assets/level00/backe.jpg");
			scene2.addChild(backE);
			var backS : DObject = new DObject(backSClass,"assets/level00/backs.jpg");
			scene2.addChild(backS);
			var backO : DObject = new DObject(backOClass,"assets/level00/backo.jpg");
			scene2.addChild(backO);
			backE.scale = backO.scale = backS.scale = 10;
			
			
			
			
			
			
			mapa = new ColMapa("l00nor",578,178);
			//addChild(mapa);
			mapa.scaleX = mapa.scaleY = 0.4;

			
			
		//	var miliario : IObject = new IObject(miliarioClass,"assets/level00/milirario_texture.png",41);
		//	scene.addChild(miliario);
			
			
			
			/*	P E O P L E */
			people = new Personajes_level00();
			scene.addChild(people);
			
		//	particles = new Level00_par();
			//scene.addChild(particles);
			//particles.scale = 0.2;
			
			/**
			 * 
			 * 	C A M E R A
			 * 
			 **/
			
			camera = new Camera3D();
			
			camera.target = dummy;
			
			camera.focus = 24;
			//camera.zoom = 200;
			//camera.useCulling = true;
			/*
			camera4 = new Camera3D();
			camera4.target = jugador;
			camera4.focus = 18;
			*/			
			
			//renderer = new QuadrantRenderEngine(QuadrantRenderEngine.ALL_FILTERS);
			
			renderer = new BasicRenderEngine();
			render2 = new BasicRenderEngine();			
			render3 = new BasicRenderEngine();		
			//render4 = new BasicRenderEngine();
	
			var s : StatsView = new StatsView(renderer);
			addChild(s);
			
			
		
			//mapa_nor = new ColMapa("mapanor");
			
			//addChild(mapa_nor);
			
			
			//	mapa = new ColMapa("mapa00");
		//	addChild(mapa);
			//	mapa.y = 550;
			
			
			dummy = new Dummy();
			scene.addChild(dummy);
			
			dummy_ant = new Dummy();
			
			
			
	/**
	 * 	dummy
	 * 
	 * 
	 **/
			
		}
			public function update():void
			{
				if ( Eventos.activo == 0 ) {
					/* checkCollision */
	
					
					dummy.update();
			
					var pos : Number3D = dummy.position;
					
			
					var posa : Number3D = dummy_ant.position;
						
					
					var y : Number = mapa.getZ(pos);
					dummy.setY(y);
					/*
					var posN = new Number3D(pos.x,pos.y,pos.z+5);
					var posS = new Number3D(pos.x,pos.y,pos.z-5);
					var posE = new Number3D(pos.x+5,pos.y,pos.z);
					var posO = new Number3D(pos.x-5,pos.y,pos.z);
					if (mapa.checkw(posN))
					{
						trace("jit");
						dummy.setX(pos.x);
						dummy.setY(pos.y);
						dummy.setZ(pos.z-6);
					//	dummy.copyPosition(dummy_ant);
					}else
					if (mapa.checkw(posS))
					{
						trace("jit");
						dummy.setX(pos.x);
						dummy.setY(pos.y);
						dummy.setZ(pos.z+6);
						//	dummy.copyPosition(dummy_ant);
					}else
					if (mapa.checkw(posE))
					{
						trace("jit");
						dummy.setX(pos.x-6);
						dummy.setY(pos.y);
						dummy.setZ(pos.z);
						//	dummy.copyPosition(dummy_ant);
					}else
						if (mapa.checkw(posO))
						{
							trace("jit");
							dummy.setX(pos.x+6);
							dummy.setY(pos.y);
							dummy.setZ(pos.z);
							//	dummy.copyPosition(dummy_ant);
						}
					dummy_ant.copyPosition(dummy);
					
					*/
					if (mapa.checkw(pos))
					{
						trace("jit");
						dummy.copyPosition(dummy_ant);
					}
					
					dummy_ant.copyPosition(dummy);
					
					camera.copyTransform(dummy);
					camera.moveBackward(10);
					
					if(Eventos.isMD)
					{
						
						 var rotX= 0.3;
						var rotY = 0.02;
						var camPitch = 90;
						var camYaw = 270;
						var xDist:Number = Eventos.msPX - EmeritaAugusta.WIDTH * 0.5;
						var yDist:Number = Eventos.msPY - EmeritaAugusta.HEIGHT * 0.5;
						
						camPitch = xDist * rotX + 90;
						camYaw = yDist * rotY - 90 ;
						camera.orbit(-camYaw,-camPitch);
						/*
						var xDist:Number = Eventos.msPX - EmeritaAugusta.WIDTH * 0.5;
						var yDist:Number = Eventos.msPY - EmeritaAugusta.HEIGHT * 0.5;
						
						camPitch =(yDist * 0.2 + 100) / 2*Math.PI;
						camYaw = xDist ;
						
						camera.yaw(xDist);
					
						
						camera.pitch(yDisty);
					//	camera.orbit(-camPitch,-camYaw);
						*/
						}
					
					/*
					var xDist:Number = Eventos.msPX - EmeritaAugusta.WIDTH * 0.5;
					var yDist:Number = Eventos.msPY - EmeritaAugusta.HEIGHT * 0.5;
					
					camPitch = yDist * rotX + 90;
					camYaw = xDist * rotY + 270;
					camera.orbit(-camPitch,-camYaw);
					*/
					
					renderer.renderScene( scene  , camera , viewport  );
					render2.renderScene( scene2  , camera , viewport2  );
					render3.renderScene( scene3  , camera , viewport3  );
					
					
				}else{
					//	trace("Sound"+sound3d);
					//	sound3d.stop();
				}
			}
		}
	}