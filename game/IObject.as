package game
{
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.events.Event;
	import flash.filters.GlowFilter;
	
	import org.papervision3d.events.InteractiveScene3DEvent;
	import org.papervision3d.materials.BitmapFileMaterial;
	import org.papervision3d.materials.ColorMaterial;
	import org.papervision3d.materials.utils.MaterialsList;
	import org.papervision3d.objects.DisplayObject3D;
	import org.papervision3d.objects.parsers.Collada;
	import org.papervision3d.objects.primitives.Cube;
	
	


		
	
	

	public class IObject extends DisplayObject3D
	{
		private var _clase : Collada;
		private var text : String;
		private var _id : Number;
		
		private var mat : BitmapFileMaterial;
		public var do3D: DisplayObject3D;
		
		private var filter : GlowFilter 
		private var filter0 : GlowFilter 
		
		public function IObject(clase:*,text:String,id:Number)
		{
		
			this.filter =  new GlowFilter (0xfafafa,0.6,10,10,40,1,false,false);
			this.filter0 =  new GlowFilter (0x0f0afa,0,0,0,0,0,false,false);
			
			
			this._clase =  new Collada(XML(new clase()));
			this._id = id;
			
			this.mat = new BitmapFileMaterial(text,false);
	
			init();
			
		}
		
	
		
		public function init():void{
			
			
			this.mat.tiled = true;
			this.mat.maxU = 20;
			this.mat.maxV = 20;
			
			
			
			do3D = new DisplayObject3D();
			do3D = getColladaDisplayObj(this._clase);
			
			
			
			do3D.material = this.mat;
			do3D.material.interactive = true;
			
			do3D.useOwnContainer = true;

			do3D.filters = [filter0];
		
			
			addChild(do3D); 
			
			/*
			var matC : ColorMaterial = new ColorMaterial(0xffffff,0.2,true);
		    var matL : MaterialsList = new MaterialsList();
			matL.addMaterial(matC,"all");
			
			var cube : Cube = new Cube(matL, 60,60,100,2,2,2,Cube.TOP+Cube.BOTTOM);
			*/
			
			do3D.addEventListener(InteractiveScene3DEvent.OBJECT_PRESS, onPlaneClick);
			do3D.addEventListener(InteractiveScene3DEvent.OBJECT_OVER, onPlaneOver);
			do3D.addEventListener(InteractiveScene3DEvent.OBJECT_OUT, onPlaneOut);
		//	this.do3D.addChild(cube)
				
				
		}
		
		private function onPlaneOut(evt:InteractiveScene3DEvent):void 
		{
			do3D.filters = [filter0];
		}
		
		private function onPlaneOver(evt:InteractiveScene3DEvent):void 
		{
		//	trace("filter");
			do3D.filters = [filter];
		}
		
		private function onPlaneClick(evt:InteractiveScene3DEvent):void 
		{
			do3D.filters = [filter0];
			Eventos.activo = this._id;	
			//trace("juas PRESS2"+this._id);
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

/*
private function weldVerticesAndFaces(object:Object3D):void {

if(object is Mesh) {

MeshUtils.removeSingularFaces(Mesh(object));

MeshUtils.removeUselessVertices(Mesh(object));

MeshUtils.autoWeldVertices(Mesh(object), 0.01);

MeshUtils.autoWeldFaces(Mesh(object), 0.01, 0.001);

}
}


// Launching procedure for object’s children

for (var key:* in object.children) {

weldVerticesAndFaces(key);

}

*/
