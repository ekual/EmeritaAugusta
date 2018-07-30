package utils
{
	import org.papervision3d.core.geom.TriangleMesh3D;
	import org.papervision3d.core.geom.renderables.Triangle3D;
	import org.papervision3d.core.geom.renderables.Triangle3DInstance;
	import org.papervision3d.core.geom.renderables.Vertex3D;
	import org.papervision3d.core.math.Number3D;
	import org.papervision3d.core.math.NumberUV;
	import org.papervision3d.materials.ColorMaterial;
	import org.papervision3d.objects.DisplayObject3D;

	public class Colision extends DisplayObject3D
	{
		private var afaces : Array;
		private var pos :Number3D;
		
		private var actFace:TriangleMesh3D;
		private var aMesh:TriangleMesh3D;
	//	private var aFace:Face3D;
		private var dobject:DisplayObject3D = new DisplayObject3D();;
		
		public function Colision(col:DisplayObject3D)
		{
			this.afaces = col.geometry.faces;
			
			this.dobject = col;
			
			//var aface:Array = this.faces[1];
			//var aver:Array = col.geometry.vertices[1];
			//trace ("fa"+aface+":"+aver);
			//this.actFace = new TriangleMesh3D(new ColorMaterial(),aver,aface,"tri");
				
		}
		
		public function drawAllFaces():void
		{
			for ( var i = 0; i < this.afaces.length -1 ; i++)
			{
				drawFace(i);
			}
		}
		public function drawFace(face:Number = 0):void
		{
			trace ("DF:"+ this.dobject.geometry.faces[face]);
			
			if (!this.dobject.geometry.faces[face] == "undefined")
			{
			
			var face_act : Triangle3D = this.dobject.geometry.faces[face];
			
	
			var tri : TriangleMesh3D = new TriangleMesh3D(new ColorMaterial(0xff00ff),face_act.vertices,[face_act]);
		//	tri.geometry.faces.push(face_act);
			tri.geometry.vertices = face_act.vertices;
			tri.geometry.ready = true;
			
			addChild(tri);
			
			tri = null;
			face_act = null;
			}
			/*
			var ve : Array = [this.
			var face : Triangle3D = new Triangle3D(this, [ve[vertexIndex1], ve[vertexIndex2], ve[vertexIndex3]], null, [ new NumberUV(uv00, uv01), new NumberUV(uv10, uv11), new NumberUV(uv20, uv21) ] );
			face.faceNormal = new Number3D(normalx,normaly,normalz);
			fa.push(face);

			var vA : Vertex3D = this.afaces[0] as Vertex3D;
			var vB : Vertex3D = this.afaces[1] as Vertex3D;
			var vC : Vertex3D = this.afaces[2] as Vertex3D;
				
			var nA : NumberUV = new NumberUV(1,1);
			var nB : NumberUV = new NumberUV(1,-1);
			var nC : NumberUV = new NumberUV(-1,1);
			
			var tri3D :Triangle3D = new Triangle3D(this.dobject,[],null,[]);
			tri3D.vertices = [];
			tri3D.fae
			
		//	tri.geometry.vertices.push(vA,vB,vC);
		//	tri.geometry.faces.push(new Triangle3D(tri, [tri.geometry.vertices[0],tri.geometry.vertices[1],tri.geometry.vertices[2]],null,[nA,nB,nC]));
	
			
			
			
			//addChild(tri);
			trace("T"+tri);
			*/
		}
		public function getFace(pos:Number3D):Number
		{
			this.pos = pos;
			//this.afaces.forEach(tracePos);
			var face : Number = buscarFace(pos);
			return face;
		}
		
		public function getY(face:Number):Number
		{
			if (face !== -1 ) {
			var face_act : Triangle3D = this.dobject.geometry.faces[face];
			
			return face_act.v0.y;
			}else {return 0; }
		}
		
		
		public function buscarFace(pos:Number3D):Number
		{
			trace(pos);
			for ( var i:Number = 0; i < this.afaces.length -1 ; i++)
			{
				var face_act : Triangle3D = this.afaces[i];
				
				var limits:Array = getLimits(face_act);
				if ( checkColision(pos,limits[0],limits[1],limits[2],limits[3]) )
				{
					return i;
				}
			}
			return -1;
		}
		
		public function tracePos(element:*,index:Number,arr:Array):void{
			
		trace ( " trace Pos " + this.pos);
			var face_act : Triangle3D = element;
			var v0 : Vertex3D = face_act.v0;
			var v1 : Vertex3D = face_act.v1;
			var v2 : Vertex3D = face_act.v2;
			
			var lx : Number = 0;
			var ly : Number = 0;
			var lix : Number = 0;
			var liy : Number = 0;
			
			//limite superior
			lx = v0.x;
			if ( v1.x > lx ){ lx = v1.x} if (v2.x > lx ) { lx = v2.x; }
			
			ly = v0.y;
			if ( v1.y > ly ){ ly = v1.y} if (v2.y > ly ) { ly = v2.y; }
			
			
			lix = v0.x;
			if ( v1.x > lix ){ lix = v1.x} if (v2.x < lix ) { lix = v2.x; }
			
			liy = v0.y;
			if ( v1.y < liy ){ liy = v1.y} if (v2.y < liy ) { liy = v2.y; }
			
		
			

			
			
		}
		public function checkColision(pos:Number3D,lx:Number,lix:Number,ly:Number,liy:Number):Boolean
		{
			if ((this.pos.x < lx ) && ( this.pos.x > lix ) && ( this.pos.z < ly ) && (this.pos.z > liy ))
			{return true;}else{return false;}	
		}
		
		public function getLimits(face_act:Triangle3D):Array
		{
		
			var v0 : Vertex3D = face_act.v0;
			var v1 : Vertex3D = face_act.v1;
			var v2 : Vertex3D = face_act.v2;
			
			var lx : Number = 0;
			var ly : Number = 0;
			var lix : Number = 0;
			var liy : Number = 0;
			
			//limite superior
			lx = v0.x;
			if ( v1.x > lx ){ lx = v1.x} if (v2.x > lx ) { lx = v2.x; }
			
			ly = v0.z;
			if ( v1.z > ly ){ ly = v1.z} if (v2.z > ly ) { ly = v2.z; }
			
			
			lix = v0.x;
			if ( v1.x > lix ){ lix = v1.x} if (v2.x < lix ) { lix = v2.x; }
			
			liy = v0.z;
			if ( v1.z < liy ){ liy = v1.z} if (v2.z < liy ) { liy = v2.z; }
			
			return [lx,lix,ly,liy];
		}
			
	}
}