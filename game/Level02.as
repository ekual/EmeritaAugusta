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
	
	import utils.DataManager;
	
	public class Level02 extends Sprite
	{
		
		/*
		[Embed(source = "assets/mitreo/cm_geom2.dae", mimeType = "application/octet-stream")]
		private var geomClass:Class;
		
		[Embed(source = "assets/mitreo/cm_entrada.dae", mimeType = "application/octet-stream")]
		private var casaClass:Class;
		
		[Embed(source = "assets/mitreo/cm_pasillo01.dae", mimeType = "application/octet-stream")]
		private var pasilloClass:Class;
		
		
		
		[Embed(source = "assets/mitreo/cm_techo_h01.dae", mimeType = "application/octet-stream")]
		private var techoClass:Class;
		
		[Embed(source = "assets/mitreo/cm_suelo_h01.dae", mimeType = "application/octet-stream")]
		private var sueloh01Class:Class;
		
		[Embed(source = "assets/mitreo/cm_columna00.dae", mimeType = "application/octet-stream")]
		private var columnaClass:Class;
		
		[Embed(source = "assets/mitreo/cm_entrada_pared_h01.dae", mimeType = "application/octet-stream")]
		private var paredClass:Class;
		
		[Embed(source = "assets/mitreo/cm_tejado_00.dae", mimeType = "application/octet-stream")]
		private var tejadoClass:Class;
		
		
		[Embed(source = "assets/mitreo/cm_altillo.dae", mimeType = "application/octet-stream")]
		private var altilloClass:Class;
		
		
		[Embed(source = "assets/mitreo/cm_columnas.dae", mimeType = "application/octet-stream")]
		private var columnasClass:Class;
		
		
		[Embed(source = "assets/mitreo/cm_pozo.dae", mimeType = "application/octet-stream")]
		private var pozoClass:Class;
		
		[Embed(source = "assets/mitreo/cm_muro_peristilo_h02.dae", mimeType = "application/octet-stream")]
		private var pozo2Class:Class;
		
		[Embed(source = "assets/mitreo/cm_pared_h02.dae", mimeType = "application/octet-stream")]
		private var pared2Class:Class;
		
		
		[Embed(source = "assets/mitreo/cm_pasillo02.dae", mimeType = "application/octet-stream")]
		private var pasillo2Class:Class;
		
		[Embed(source = "assets/mitreo/cm_techo_h02.dae", mimeType = "application/octet-stream")]
		private var techo2Class:Class;	
		
		[Embed(source = "assets/mitreo/cm_habitacion02.dae", mimeType = "application/octet-stream")]
		private var habitacion2Class:Class;	
		
		[Embed(source = "assets/mitreo/cm_columnas_h02.dae", mimeType = "application/octet-stream")]
		private var columnas2Class:Class;	
		*/
		
		[Embed(source = "assets/level02/entrada00.dae", mimeType = "application/octet-stream")]
		private var entradaClass:Class;
		
		[Embed(source = "assets/level02/tejado00.dae", mimeType = "application/octet-stream")]
		private var tejadoClass:Class;
		
		[Embed(source = "assets/level02/pasillo00_suelo.dae", mimeType = "application/octet-stream")]
		private var pasillo00_sueloClass:Class;
		
		[Embed(source = "assets/level02/pasillo00_pared.dae", mimeType = "application/octet-stream")]
		private var pasillo00_paredClass:Class;
		
		[Embed(source = "assets/level02/hab00_pared.dae", mimeType = "application/octet-stream")]
		private var hab00_paredClass:Class;
		
		[Embed(source = "assets/level02/hab00_suelo.dae", mimeType = "application/octet-stream")]
		private var hab00_sueloClass:Class;
		
		
		[Embed(source = "assets/level02/columnas_h00.dae", mimeType = "application/octet-stream")]
		private var columnas_h00Class:Class;
		
		[Embed(source = "assets/level02/peristilo_h00.dae", mimeType = "application/octet-stream")]
		private var peristilo_h00Class:Class;
		
		[Embed(source = "assets/level02/techo_h00.dae", mimeType = "application/octet-stream")]
		private var techo_h00Class:Class;
		
		[Embed(source = "assets/level02/altillo_h00.dae", mimeType = "application/octet-stream")]
		private var altillo_h00Class:Class;
		
		
		[Embed(source = "assets/level02/columnas_altillo_h00.dae", mimeType = "application/octet-stream")]
		private var columnas_altillo_h00Class:Class;
		
		
		/* */ 
		[Embed(source = "assets/level02/pasillo01_pared.dae", mimeType = "application/octet-stream")]
		private var pasillo01_paredClass:Class;
		
		[Embed(source = "assets/level02/pasillo01_suelo.dae", mimeType = "application/octet-stream")]
		private var pasillo01_sueloClass:Class;
		
		
		[Embed(source = "assets/level02/hab01_pared.dae", mimeType = "application/octet-stream")]
		private var hab01_paredClass:Class;
		
		[Embed(source = "assets/level02/hab01_suelo.dae", mimeType = "application/octet-stream")]
		private var hab01_sueloClass:Class;
		
		[Embed(source = "assets/level02/columnas_h01.dae", mimeType = "application/octet-stream")]
		private var columnas_h01Class:Class;
		
		[Embed(source = "assets/level02/techo_h01.dae", mimeType = "application/octet-stream")]
		private var techo_h01Class:Class;
		
		[Embed(source = "assets/level02/tejado_h01.dae", mimeType = "application/octet-stream")]
		private var tejado_h01Class:Class;
		
		[Embed(source = "assets/level02/peristilo_h01.dae", mimeType = "application/octet-stream")]
		private var peristilo_h01Class:Class;
		
		[Embed(source = "assets/level02/estatua.dae", mimeType = "application/octet-stream")]
		private var estatuaClass:Class;
		
		[Embed(source = "assets/level02/pedestal.dae", mimeType = "application/octet-stream")]
		private var pedestalClass:Class;
		
		
		
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
		private var dummy_ant:Dummy;
	
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
		
		private var pos_ini: Number3D = new Number3D(00,0,0);
		
		
		
		public function Level02()
		{
			init();
		}
		private function init()
		{
			
			
			viewport = new Viewport3D(1300,712,false,true,true,false);
			viewport.interactive = true;
			
			viewport2 = new Viewport3D(1300,712,false,false,false,false);
			viewport3 = new Viewport3D(1300,712,false,false,false,false);
			
			
			
			
			addChild(viewport2);	
			
			
			addChild(viewport3);
			
			addChild(viewport);
			scene = new Scene3D();
			scene2 = new Scene3D();
			scene3 = new Scene3D();
			
			
			//SOUNDS
			/*
			channel = new SoundChannel();
			sound = new Sound();
			sound = DataManager.getData("epitafio");
			
			sound3d = new Sound3D(sound);
			sound3d.maxSoundDistance = 10000;
			sound3d.position = new Number3D(4000,10,4000);
			
			sound3d.play(0,4);
			scene.addChild(sound3d);
			
			*/
			
			// SKYBOXES
			var material : BitmapFileMaterial = new BitmapFileMaterial("assets/nubes.jpg",false);
			
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
			
			var cube : Cube = new Cube(ml,4000,4000,4000,3,3,3,Cube.TOP+Cube.BOTTOM);//,Cube.TOP+Cube.BOTTOM
			
			
			
			//scene3.addChild(cube);
			
			
			//	cube.y  = 10;
			
			
			
			//sky = new SkyBoxes();
			//scene3.addChild(sky);
			
			
			plane = new PlaneL();
			//scene3.addChild(plane);
			plane.z = 30000;
			plane.x = 6000;
			plane.y = -1000;
			
			
			
			
			
			
			//terrain
			/*
			var columna:DObject = new DObject(columnaClass,"assets/mitreo/columna2.png",false);			
			var columna1:DObject = new DObject(columnaClass,"assets/mitreo/columna2.png",false);			
			var columna2:DObject = new DObject(columnaClass,"assets/mitreo/columna2.png",false);			
			var columna3:DObject = new DObject(columnaClass,"assets/mitreo/columna2.png",false);			
			
			columna2.x = -200;
			columna3.z = 200;
			
			columna1.x = -200;
			columna1.z = 200;
			scene.addChild(columna);	
			scene.addChild(columna1);
			scene.addChild(columna2);
			scene.addChild(columna3);
			
			var geom:DObject = new DObject(geomClass,"assets/mitreo/suelomitreo1.jpg");
			scene.addChild(geom);
			
			//		do3d = geom.do3D;
			*/
			
			var entrada : DObject = new DObject(entradaClass,"assets/texturas/edifa.jpg",1);
			var tejado : DObject = new DObject(tejadoClass,"assets/texturas/edifa.jpg",1);
			var pasillo00_suelo :DObject = new DObject(pasillo00_sueloClass,"assets/level02/pasillo_esc.jpg",1);
			var pasillo00_pared:DObject = new DObject(pasillo00_paredClass,"assets/level02/pared_pasillo.jpg",1);
			
			scene.addChild(entrada);
			scene.addChild(tejado);
			scene.addChild(pasillo00_suelo);
			scene.addChild(pasillo00_pared);
			
			
			var hab00_suelo : DObject = new DObject(hab00_sueloClass,"assets/level02/suelomitreo0.jpg",1);
			var hab00_pared : DObject = new DObject(hab00_paredClass,"assets/level02/pared.jpg",1);
			var columnas_h00 : DObject = new DObject(columnas_h00Class,"assets/level02/columnas_h00.jpg",1);
			var peristilo_h00:DObject = new DObject(peristilo_h00Class,"assets/level02/altillo_h00.jpg",1);
			var techo_h00:DObject = new DObject(techo_h00Class,"assets/texturas/edifa.jpg",1);
			var altillo_h00:DObject = new DObject(altillo_h00Class,"assets/level02/altillo_h00.jpg",1);
			var columnas_altillo:DObject = new DObject(columnas_altillo_h00Class,"assets/level02/altillo_h00.jpg",1);
			
			scene.addChild(hab00_suelo);
			scene.addChild(hab00_pared);
			scene.addChild(columnas_h00);
			scene.addChild(peristilo_h00);
			scene.addChild(techo_h00);
			scene.addChild(altillo_h00);
			scene.addChild(columnas_altillo);
			
			/**/
			
			
			var pasillo01_pared : DObject =new DObject(pasillo01_paredClass,"assets/level02/pared.jpg");
			var pasillo01_suelo : DObject = new DObject(pasillo01_sueloClass,"assets/level02/pasillo_esc.jpg");
			
			var hab01_suelo : DObject = new DObject(hab01_sueloClass,"assets/level02/habitacion01b.jpg");
			var hab01_pared : DObject = new DObject(hab01_paredClass,"assets/level02/paredh01.jpg");
			var techo_h01:DObject = new DObject(techo_h01Class,"assets/texturas/edifa.jpg");
			var tejado_h01:DObject = new DObject(techo_h01Class,"assets/texturas/edifa.jpg");
			
			var columnas_h01 	 : DObject = new DObject(columnas_h01Class,"assets/level02/columnas_h01.jpg");
			var peristilo_h01:DObject = new DObject(peristilo_h01Class,"assets/level02/altillo_h00.jpg");
			
			
			var estatua  : DObject = new DObject(estatuaClass,"assets/level02/estatua.png");
			var pedestal :DObject = new DObject(pedestalClass,"assets/level02/marmol.jpg");
			
			scene.addChild(pasillo01_pared);
			scene.addChild(pasillo01_suelo);
			scene.addChild(hab01_suelo);
			scene.addChild(hab01_pared);
			scene.addChild(techo_h01);
			scene.addChild(tejado_h01);
			scene.addChild(columnas_h01);
			scene.addChild(peristilo_h01);
			
			scene.addChild(estatua);
			scene.addChild(pedestal);
			
			var profesor:IParticle = new IParticle("profe",5);
			scene.addChild(profesor);
			profesor.z = 910;
			profesor.x = -401;
			profesor.y = -100;
			/*
			var suelo_h02:DObject = new DObject(habitacion2Class,"assets/mitreo/suelomitreo1.jpg");
			scene.addChild(suelo_h02);
			
			var pared_h02:DObject = new DObject(pared2Class,"assets/mitreo/pasillo.jpg");
			scene.addChild(pared_h02);
			
			var columnas_h02:DObject = new DObject(columnas2Class,"assets/mitreo/altillo_h01.png");
			scene.addChild(columnas_h02);
			
			var pozo2:DObject = new DObject(pozo2Class,"assets/mitreo/altillo_h01.png");
			scene.addChild(pozo2);
			
			
			
			var techo2:DObject =new DObject(techo2Class,"assets/texturas/edifa.jpg",true);
			scene.addChild(techo2);
			
			var pasillo2:DObject =new DObject(pasillo2Class,"assets/mitreo/pasillo01.png",true);
			scene.addChild(pasillo2);
			
			var techo:DObject =new DObject(techoClass,"assets/texturas/edifa.jpg",true);
			scene.addChild(techo);
			
			var pasillo:DObject =new DObject(pasilloClass,"assets/mitreo/pasillo01.png",true);
			scene.addChild(pasillo);
			
			
			
			var altillo:DObject =new DObject(altilloClass,"assets/mitreo/altillo_h01.png",true);
			scene.addChild(altillo);
			
			var tejado:DObject = new DObject(tejadoClass,"assets/texturas/edifa.jpg",true);
			scene.addChild(tejado);
			
			var casa:DObject =new DObject(casaClass,"assets/texturas/edifa.jpg",false);
			scene.addChild(casa);
			
			var suelo_h01:DObject = new DObject(sueloh01Class,"assets/mitreo/suelo_mitreo.png");
			scene.addChild(suelo_h01);
			
			var pared_h01:DObject = new DObject(paredClass,"assets/mitreo/pasillo.jpg");
			scene.addChild(pared_h01);
			
			var columnas_h01:DObject = new DObject(columnasClass,"assets/mitreo/altillo_h01.png");
			scene.addChild(columnas_h01);
			
			var pozo:DObject = new DObject(pozoClass,"assets/mitreo/altillo_h01.png");
			scene.addChild(pozo);
			
			*/
			
			

			/*
			dummy.setZ(1000);
			dummy.setX(1000);
			
			jugador.setZ(1000);
			jugador.setX(1000);
			*/
			
			/*	P E O P L E */
			/*
			people = new Personajes_level00();
			scene.addChild(people);
			
			particles = new Level00_par();
			scene.addChild(particles);
			particles.x = -200;
			*/
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
	
			
		//	beginRender();
			mapa = new ColMapa("l02nor",74,12);
			addChild(mapa);
			mapa.scaleX = mapa.scaleY = 0.4;
			
			var s : StatsView = new StatsView(renderer);
			addChild(s);
	
			
			dummy = new Dummy();
			scene.addChild(dummy);
			
			dummy_ant = new Dummy();
			
		}
		
		private function beginRender():void
		{
			this.addEventListener(Event.ENTER_FRAME,render);
		}
		
		private function render(e:Event):void
		{
			if ( Eventos.activo == 0 ) {
				dummy.update();
				jugador.update();
				//sound3D.updateSound(camera);
				
				//jugador.copyPosition(dummy);
				
				
				/* checkCollision */
				var pos :Number3D = new Number3D();
				pos =  dummy.getPos();
				
				var z:Number = this.mapa.getZw(pos);
				
				if (this.mapa.checkw(pos))
					
					//	if (dummy.hitTestObject(do3d)) {trace("hit!")}else{trace("no hit!")}
					//if( true)
				{
					jugador.copyPosition(dummy);
				}else{	dummy.copyPosition(jugador);}
				
				
				//}else { dummy.copyPosition(jugador); }
				
				
				//sound3d.updateSound(camera);
				
				camera.copyTransform(jugador);
				
				//	camera.moveUp(0);
				
				camera.moveBackward(10);
				
				//camera.moveBackward(-100);
				
				//renderer.renderScene(scene,camera,viewport);
				
				render1.renderScene( scene  , camera , viewport  );
				//	render2.renderScene( scene2 , camera , viewport2 );
				//	render3.renderScene( scene3 , camera , viewport3 );
				//	render4.renderScene( scene4, camera4,viewport4);
			}else{
				
			}// sound3d.stop(); }
		}
		
		public function update():void
		{
			if ( Eventos.activo == 0 ) {
				/* checkCollision */
				
				
				dummy.update();
				
				var pos : Number3D = dummy.position;
				
				
				var posa : Number3D = dummy_ant.position;
				
				
				var y : Number = mapa.getZ2(pos);
				dummy.setY(y);
				
				if (mapa.checkw(pos))
				{
					trace("jit");
					dummy.copyPosition(dummy_ant);
				}
				
				dummy_ant.copyPosition(dummy);
				
				
				
				camera.copyTransform(dummy);
				camera.moveBackward(10);
				
				/*
				var xDist:Number = Eventos.msPX - EmeritaAugusta.WIDTH * 0.5;
				var yDist:Number = Eventos.msPY - EmeritaAugusta.HEIGHT * 0.5;
				
				camPitch = yDist * rotX + 90;
				camYaw = xDist * rotY + 270;
				camera.orbit(-camPitch,-camYaw);
				*/
				
				render1.renderScene( scene  , camera , viewport  );
				render2.renderScene( scene2  , camera , viewport2  );
				render3.renderScene( scene3  , camera , viewport3  );
				
				
			}else{
				//	trace("Sound"+sound3d);
				//	sound3d.stop();
			}
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