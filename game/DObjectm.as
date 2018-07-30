package game
{
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.events.Event;
	
	import org.papervision3d.events.InteractiveScene3DEvent;
	import org.papervision3d.materials.BitmapFileMaterial;
	import org.papervision3d.materials.ColorMaterial;
	import org.papervision3d.materials.utils.MaterialsList;
	import org.papervision3d.objects.DisplayObject3D;
	import org.papervision3d.objects.parsers.Collada;
	import org.papervision3d.objects.primitives.Cube;
	
	


		
	
	

	public class DObjectm extends DisplayObject3D
	{
		

		private var _clase : Collada;
		private var text : String;
		private var _id : Number;
		
		private var mat : BitmapFileMaterial;
		public var do3D: DisplayObject3D;
		
		public var precise : Boolean;
		
		
		public function DObjectm(clase:*,tmat:*,precise:Boolean=false)
		{
		
			this._clase =  new Collada(XML(new clase()));
			this._id = id; 
			
			this.mat = tmat;
			
			init();
	
		}
		public function setSmooth():void
		{
			this.mat.smooth = true;
				this.mat.baked = true;
		}
	
		public function setPrecision(precise:Boolean=true,nprecision:int=8):void
		{
			this.mat.precise = precise;
			this.mat.precision = nprecision;
			
		}
	
		
		public function init():void{
			
	//		this.mat.smooth = true;
			this.mat.tiled = true;
			this.mat.maxU = 20;
			this.mat.maxV = 20; 
			this.mat.oneSide =true;
			
			
			do3D = new DisplayObject3D();
			do3D = getColladaDisplayObj(this._clase);
			
			
			
			do3D.material = this.mat;

		
			
			addChild(do3D); 
			
			
	
				
		}
		
		public function setDouble():void{
			this.do3D.material.doubleSided = true;
		}

		public function get do3d():DisplayObject3D{return this.do3D; }
		
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
