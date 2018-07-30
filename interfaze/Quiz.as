package interfaze
{
	import br.com.stimuli.loading.BulkLoader;
	
	import com.greensock.TweenLite;
	
	import flash.display.Bitmap;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.media.Sound;
	import flash.media.SoundChannel;
	
	import prueba.Lira;
	
	import utils.Bocadillo;
	import utils.Boton;
	import utils.DataManager;
	import utils.Texto;
	
	
	public class Quiz extends Sprite
	{
		private var marco_texto : Texto;
		
		private var aux_string : String;
		
		private var conversacion : Array;
		private var quiza : Array;
		
		private var texto_actual : String = new String();
		private var indice_texto_actual : int = 0;
		private const TEXT : int = 1;
		
		private var container : Sprite;
		
		public var tween :TweenLite;
		
		public var next_activo = 0;
		private var activo : Number = 0;
		private var sonando : Number = 0;
		
		

		private var sound : Sound;
		private var sound_channel : SoundChannel;
		
		
		private static const  boc_x : Number = 260;
		private static const  boc_y : Number = 200;

		
		private static const  boc_bx : Number =400;
		private static const  boc_by : Number = 120;

		public var lira:Lira;
		
		public function Quiz()
		{
			
			lira = new Lira();
			marco_texto = new Texto();
			marco_texto.name = "marco";
			
			container = new Sprite();
			addChild(container);
			
			sound = new Sound();
			
			sound_channel = new SoundChannel();
			
			
			this.conversacion = new Array(
				["Kid", "Look, a robot!","intro.mp3"], 
				["Abe", "BLEEP-BLOOP. I am an Autonomous Botanical Engineer. You can call me ABE.","intro.mp3"],
				["Kid", "Hi Abe. Meet Frosty the Snowman."],
				["Frosty", "Happy Birthday!"],
				["Abe", "BEEP-BIP. Hello, Frosty."],
				["Abe", "Does this frog belong to you?"],
				["Frog", "Ribbit..."], 
				["Kid", "No I\'ve never seen him before. Aren\'t you cold frog?"], 
				["Frog", "Ribbit..."]);
			
			
			
			
			this.quiza = new Array(
				["julia01",["Hola, que te pasa ? ",5],[" Que Sucede ? ",5]],
				["tulio01",["¿ Que instrumento estas tocando ?",35],["¿ Cual es la melodia que interpretas ?",17],["¿ Puedo intentarlo yo ?",50]],
				["quiz3",["¿ Que te sucede ?",21],["Hola , ¿ Te encuentras bien ? ",21]]
			);
			
			
			addChild(marco_texto);
			marco_texto.y = 300;
			marco_texto.x = 300;
			
			activo = 0;
			
		}
		
		private function onLoaded(e:Event):void
		{
			
			//	bmp = loader.getBitmap("bg");
			
			
			
		}
		public function update()
		{
			//salta el indice 00 
			//al pulsar o acercarse a un romano
			//so indice = 1
			//SO si indice & ocupado = false
			//mostrar (indice);
			if (Eventos.activo != 0 )
			{
				Eventos.hablando  = true;
			if (( activo == 0  ) && ( sonando == 0 ))  
			{
			
				switch(Eventos.activo)
				{
					// activo
					case 0 : break;
					//siguiente
					case 1 :  break;
					//trivia
					case 2 : activo = 1; 
						trace("romano");
						
						trivia(1);
						
						break;
					case 3 : activo = 1;
						//this.marco_texto.escribir("Hola soy un pastor");
						//marco_texto.addEventListener(Texto.COMPLETE,onComplete);
						var mt : Texto = new Texto();
						mt.name = "tito000";
						container.addChild(mt);
						mt.escribir("Hola chico, por tu color de piel tu familia debe proceder del otro lado del estrecho, verdad?");
						mt.addEventListener(Texto.COMPLETE,onComplete);
						
						
						break;
					
					case 4 :
						trace("julia press");
						activo = 1; 
						var mt : Texto = new Texto();
						
						mt.x = boc_x;
						mt.y = boc_y;
						mt.name = "tito000";
						container.addChild(mt);
						mt.escribir("Hola, ¿ Que te sucede ? ");
						next_activo = 21;
						
						mt.addEventListener(Texto.COMPLETE,onCompleteNext);
						
						/*
						
						var aux_array : Array = new Array();
						aux_array = this.quiza[1];
						
						
						var spt : Sprite = new Sprite();
						container.addChild(spt);
						
						for ( var i : Number =  1 ; i < aux_array.length ; i ++ )
						{
							var btn00 = new Boton();
							trace(aux_array[i][1]);
							
							btn00.setId(aux_array[i][1]);
							btn00.x = 0; btn00.y = i * 120; 
							spt.addChild(btn00);
							TweenLite.from(btn00,2,{alpha:0,y :i*120});
							
							btn00.setTexto(aux_array[i][0]);
							btn00.addEventListener(MouseEvent.CLICK,cerrar);
						}
						
						*/
						
						break;
					case 5 :
						
						activo = 1; 
						
						///lo k nos kedad es crear una clase sonido
						
						
						sound = DataManager.getData("tito002");
						sound.play();
						
						sound.addEventListener(Event.COMPLETE,onSoundComplete);
						//	this.sonido.setSound("tito000");
						//	this.sonido.play();
						
						this.marco_texto.escribir(" Hola chico, por tu color de piel tu familia debe proceder del otro lado del estrecho, verdad? ");
						activo = 0;
						
						break;
					
					case 10 : // pastor
						activo = 1;
					//	var botonB : Boton = new BotonB("Definitivamente, no soy Orfeo con la Lira");
						
					//	addChild(botonB);
						break;
					
					case 23 : 
						trace("lira");
						activo = 1;
						
				//		var lira : Lira = new Lira();
				//		container.addChild(lira);
				//		
						break;
					
					case 11 : activo = 1;
						trace("activo 11");
						//this.marco_texto.escribir("Hola soy un pastor");
						//marco_texto.addEventListener(Texto.COMPLETE,onComplete);	
						/*
						var bocadillo = new Bocadillo("Definitivamente no soy Orfeo con la Lira");
						
						var bocadillo = new Bocadillo("Definitivamente no soy Orfeo con la Lira");
						container.addChild(bocadillo);
						bocadillo.x = 400;
						bocadillo.y = 200;
						
						bocadillo.addEventListener(MouseEvent.CLICK,cerrar);
						
						*/
						var mt : Texto = new Texto();
						
						mt.x = boc_bx;
						mt.y = boc_by;
						mt.name = "tito000";
						container.addChild(mt);
						mt.escribir("Definitivamente no soy Orfeo con la Lira");
					//	next_activo = 12;
						next_activo = 12;
						
						mt.addEventListener(Texto.COMPLETE,onCompleteNext);
						
						
						break;
					
					case 12 : activo = 1;
						
						
						var mt:Texto = new Texto("",1);
						mt.x = boc_x;
						mt.y = boc_y;
						mt.name = "tito000";
						container.addChild(mt);
						mt.escribir("Perdone mi ignorancia, Orfeo?");
						next_activo = 13;
						mt.addEventListener(Texto.COMPLETE,onCompleteNext);
						break;
					
					case 13 : activo = 1;
						
						var mt:Texto = new Texto();
						mt.name = "tito000";
						mt.x = boc_bx;
						mt.y = boc_by;
						container.addChild(mt);
						mt.escribir("Estos jovenes, Orfeo (en griego Ορφέυς) es un personaje de la mitología griega, hijo de Apolo y la musa Calíope. ");
						next_activo = 14;
						mt.addEventListener(Texto.COMPLETE,onCompleteNext);
						break;	
					
					case 14 : activo = 1;
					 
						
						var aux_array : Array = new Array();
						aux_array = this.quiza[1];
						trace(aux_array[2]);
						
						var spt : Sprite = new Sprite();
						container.addChild(spt);
						
						//boton back pensamiento
						//boton on click delete todos menos el
						//boton.id = texto(boton.id);
						
						for ( var i : Number =  1 ; i < aux_array.length ; i ++ )
						{
							var btn00 = new Boton();
							
							
							btn00.setId(aux_array[i][1]);
							btn00.x = 300;
							btn00.y = i * 150; 
							spt.addChild(btn00);
							TweenLite.from(btn00,2,{alpha:0,y :i*130});
							
							btn00.setTexto(aux_array[i][0]);
							btn00.addEventListener(MouseEvent.MOUSE_UP,cerrar);
						}
						break;	
				
					case 35 : //lira
							activo = 1;
						var mt:Texto = new Texto("");
						mt.x = boc_bx;
						mt.y = boc_by;
						
						container.addChild(mt);
						mt.escribir("La lira (del latín «lyra», y este del griego «λύρα») es un instrumento de cuerda punteada primitiva, con forma de ábaco, cuyo origen los griegos atribuyeron a Hermes o a la musa Polimnia. ");
						next_activo = 36;
						mt.addEventListener(Texto.COMPLETE,onCompleteNext);
						break;
					
					case 36:
						activo = 1;
						var mt:Texto =new Texto("");
						mt.x = boc_bx;
						mt.y = boc_by;
						container.addChild(mt);
						mt.escribir("Fue el instrumento musical que tañó Orfeo y el que acompaña a Apolo como símbolo del Estado ciudadano, de la cultura y de la música. La lira es un instrumento musical que, como el arpa, se tocaba con las dos manos.");
						next_activo = 37;
						mt.addEventListener(Texto.COMPLETE,onCompleteNext);
						break;
					
					case 37:
						activo = 1;
						var mt:Texto = new Texto("");
						mt.x = boc_bx;
						mt.y = boc_by;
						container.addChild(mt);
						mt.escribir("En manos de David, el rey poeta y sabio, la lira evoca la unión con la divinidad y la religión. El rey David tocaba la lira para tranquilizar a Saúl.");
						next_activo = 38;
						mt.addEventListener(Texto.COMPLETE,onCompleteNext);
						break;
					
					case 38:
						activo = 1;
						var mt:Texto = new Texto("");
						mt.x = boc_bx;
						mt.y = boc_by;
						container.addChild(mt);
						mt.escribir("Los instrumentos descendientes de la lira son la cítara, la guitarra y el laúd, que continúan la tradición de la lira hasta nuestros días como los instrumentos del poeta y el trovador. Dyehuty es el dios de la sabiduría, la escritura, la música y de la Luna, en la mitología egipcia. Estaba relacionado con la música como inventor de la lira.");
						next_activo = 0;
						mt.addEventListener(Texto.COMPLETE,onCompleteNext);
						break;					
					
					
					case 17 : //epitafio
						activo =1;
						var mt:Texto = new Texto("",1,500,300);
						mt.x = boc_bx;
						mt.y = boc_by;
				
						container.addChild(mt);
						mt.escribir("El epitafio de Seikilos es un fragmento de inscripción epigráfica griega hallado en una columna de mármol puesta sobre la tumba que había hecho construir un tal Seikilos para su esposa Euterpe, cerca de Trales (en Asia Menor), actual ciudad de Aydın, a unos 30 km de la ciudad costera de Éfeso (en Turquía).");
						next_activo = 18;
						mt.addEventListener(Texto.COMPLETE,onCompleteNext);
						break;
					
					case 18:
						activo =1;
						var mt:Texto=new Texto("",1);
						mt.x = boc_bx;
						mt.y = boc_by;
						next_activo = 19;
						container.addChild(mt);
						mt.escribir("Está precedida por el siguiente texto: «Soy una imagen de piedra. Seikilos me puso aquí, donde soy por siempre, el símbolo de la evocación eterna».La estela que contiene este manuscrito constituye un ejemplo de la forma de composición musical griega, con el añadido de ser la más antigua melodía escrita que se conoce.");
						break;
					
					case 19:
						activo =1;
						var mt:Texto=new Texto("",1);
						mt.x = boc_bx;
						mt.y = boc_by;
						
						container.addChild(mt);
						mt.escribir("Según J. Chailley, la prehistoria musical tiene su explicación en la mitología. En la antigüedad convivían dos civilizaciones: una sedentaria y agrícola que se expresaba a través del aulos (flauta vegetal), y cuyo ciclo vital coincide con el ciclo de las estaciones, cultivos y ritos iniciáticos. Por otro lado existía una civilización nómada y pastoril, que se manifestaba a través de la líra o la cítara.");
						break;
					
					case 21 : activo =1;
						
						var mt:Texto = new Texto();
						mt.name = "tito000";
						mt.x = 400;
						mt.y = 200;
						container.addChild(mt);
						mt.escribir("Han asesinado a mi padre.");
						next_activo = 22;
						mt.addEventListener(Texto.COMPLETE,onCompleteNext);
						break;	
					
					case 22 : activo = 1;
						
						var mt:Texto = new Texto();
						mt.name = "tito000";
						mt.x = 40;
						mt.y = 300;
						container.addChild(mt);
						mt.escribir("¿Puedo ayudarte?");
						next_activo = 23;
						mt.addEventListener(Texto.COMPLETE,onCompleteNext);
						break;	
					
					case 23 : activo = 1;
						
						var mt:Texto = new Texto();
						mt.name = "tito000";
						mt.x = 400;
						mt.y = 20;
						container.addChild(mt);
						mt.escribir("Sólo quiero saber quién ha hecho esto, para que la justicia de Roma caiga sobre sus espaldas.");
						next_activo = 0;
						mt.addEventListener(Texto.COMPLETE,onCompleteNext);
						break;			
					
					case 14 : activo = 1;
						
						trivia(3);
						
						break;
					case 41 : 
						activo = 1;
						var bmp : Bitmap = EmeritaAugusta.lazy.getBitmap("miliario");
						container.addChild(bmp);
						container.addEventListener(MouseEvent.CLICK,cerrar);
						break;
					case 42 : 
						activo = 1;
						var bmp : Bitmap = EmeritaAugusta.lazy.getBitmap("estelas_posit");
						container.addChild(bmp);
						container.addEventListener(MouseEvent.CLICK,cerrar);
						break;
					case 43 : 
						activo = 1;
						var bmp : Bitmap = EmeritaAugusta.lazy.getBitmap("cuppae_posit");
						container.addChild(bmp);
						container.addEventListener(MouseEvent.CLICK,cerrar);
						break;
					case 44 : 
						activo = 1;
						var bmp : Bitmap = EmeritaAugusta.lazy.getBitmap("aras_posit");
						container.addChild(bmp);
						container.addEventListener(MouseEvent.CLICK,cerrar);
						break;
					case 47 : 
						activo = 1;
						var bmp : Bitmap = EmeritaAugusta.lazy.getBitmap("miliario_posit");
						container.addChild(bmp);
						container.addEventListener(MouseEvent.CLICK,cerrar);
						break;
					case 50:
						activo = 1;
						var mt:Texto = new Texto();
						mt.x = boc_bx;
						mt.y = boc_by;
						mt.name = "tito000";
						container.addChild(mt);
						mt.escribir("De acuerdo, te enseñare las primeras notas del epitafio de seikilos, y luego lo intentas tú, puedes usar los numeros 1-7, o el raton, para punzar las cuerdas");
						next_activo = 51;
						
						mt.addEventListener(Texto.COMPLETE,onCompleteNext);
						
						
						break;
					case 51:
					activo=1;
					container.addChild(lira);
					//lira.startAutoPlay();
						//	warp.removeChild(spt);
				//		lira.prueba();
						break;
					
					case 52:
					
					//	container.addChild(lira);
					//	warp.removeChild(spt);
					//	lira.prueba();
						break;
					
					
				}
			} 
			}else { Eventos.hablando = false; }
		}
		
		public function onComplete(e:Event):void
		{
			trace("complete");
			trace(e.target.name);
			var spt : Sprite = e.target as Sprite;
			//container.removeChild(spt);
			spt.addEventListener(MouseEvent.CLICK,cerrar);
			
			
			Eventos.activo = 0;
			activo = 0;
		}
		
		public function onCompleteNext(e:Event):void
		{
			//trace("complete a");
			//trace(e.target.name);
			var spt : Sprite = e.target as Sprite;
			spt.addEventListener(MouseEvent.CLICK,next);
			
			
			//Eventos.activo = 1;
			activo = 0;
			Eventos.hablando = true;
		}
		public function next(e:Event):void
		{
			cerrar();
			Eventos.activo = next_activo;
			activo = 0;
			Eventos.hablando = true;
		}

		public function cerrar(e:MouseEvent=null):void
		{
			//		trace(e.target.name);
			//var spt : Sprite = e.target as Sprite;
			//loader.remove("assets/posit-miliario.jpg");
			
			/// remove spt childsf
			container.removeChildAt(0);
			
			//Eventos.activo = 0;
			activo = 0;
			//Eventos.activo = 0;
			//bmp.y = 2000;
		}
		
		public function trivia(bloque : Number = 0)
		{
			trace("TRIVIA");
			
			
			//1.getBloque
			var aux_array : Array = new Array();
			aux_array = this.quiza[bloque];
			trace(aux_array[1][0]);
			
			var btn00 = new Boton();
			btn00.setTexto(aux_array[1][0]);
			
			var btn01 = new Boton();
			btn01.setTexto(aux_array[2][0]);
			btn01.setY(80);
			
			var btn02 = new Boton();
			btn02.setTexto(aux_array[3][0]);
			btn02.setY(160);
			
			btn02.setId(aux_array[3][1]);
			
			addChild(btn00);
			addChild(btn01);
			addChild(btn02);
			
		}
		private function siguiente( e : MouseEvent):void
		{
			trace("CLICK");
			removeEventListener(MouseEvent.CLICK, this.siguiente);
			//if this.conversacion.indice_texto_actual < this.conversacion.arrayConversacion.length){
			
			this.indice_texto_actual++;
			//else remove(this);
	
		}
		public function onSoundComplete( e : Event ):void
		{
			sonando = 0;
			//marco texto .addEventListener(click,siguiente);
			
		}
		
		
		
	}
}