package utils
{
	import flash.geom.*;
	import flash.geom.Matrix3D;
	
	final public class Point3D extends Object
	{
		public var x:Number;
		public var y:Number;
		public var z:Number;
		
		public function Point3D(param1:Number = 0, param2:Number = 0, param3:Number = 0)
		{
			this.x = param1;
			this.y = param2;
			this.z = param3;
			return;
		}// end function
		
		public function floor() : void
		{
			x = Math.floor(x);
			y = Math.floor(y);
			z = Math.floor(z);
			return;
		}// end function
		
		public function add(param1:Point3D) : void
		{
			x = x + param1.x;
			y = y + param1.y;
			z = z + param1.z;
			return;
		}// end function
		
		public function toString() : String
		{
			return "[Point3D X: " + x.toFixed(3) + " Y:" + y.toFixed(3) + " Z:" + z.toFixed(3) + "]";
		}// end function
		
		public function multiply(param1:Number) : void
		{
			x = x * param1;
			y = y * param1;
			z = z * param1;
			return;
		}// end function
		
		public function transform(param1:*) : void
		{
			var _loc_2:* = x;
			var _loc_3:* = y;
			var _loc_4:* = z;
			x = param1.a * _loc_2 + param1.b * _loc_3 + param1.c * _loc_4 + param1.d;
			y = param1.e * _loc_2 + param1.f * _loc_3 + param1.g * _loc_4 + param1.h;
			z = param1.i * _loc_2 + param1.j * _loc_3 + param1.k * _loc_4 + param1.l;
			return;
		}// end function
		
		public function get length() : Number
		{
			return Math.sqrt(x * x + y * y + z * z);
		}// end function
		
		public function clone() : Point3D
		{
			return new Point3D(x, y, z);
		}// end function
		
		public function set length(param1:Number) : void
		{
			var _loc_2:Number = NaN;
			if (x != 0 || y != 0 || z != 0)
			{
				_loc_2 = param1 / length;
				x = x * _loc_2;
				y = y * _loc_2;
				z = z * _loc_2;
			}
			else
			{
				z = param1;
			}
			return;
		}// end function
		
		public function normalize() : void
		{
			var _loc_1:Number = NaN;
			if (x != 0 || y != 0 || z != 0)
			{
				_loc_1 = Math.sqrt(x * x + y * y + z * z);
				x = x / _loc_1;
				y = y / _loc_1;
				z = z / _loc_1;
			}
			else
			{
				z = 1;
			}
			return;
		}// end function
		
		public function get lengthSqr() : Number
		{
			return x * x + y * y + z * z;
		}// end function
		
		public function reset() : void
		{
			x = 0;
			y = 0;
			z = 0;
			return;
		}// end function
		
		public function copy(param1:Point3D) : void
		{
			x = param1.x;
			y = param1.y;
			z = param1.z;
			return;
		}// end function
		
		public function invert() : void
		{
			x = -x;
			y = -y;
			z = -z;
			return;
		}// end function
		
		public function subtract(param1:Point3D) : void
		{
			x = x - param1.x;
			y = y - param1.y;
			z = z - param1.z;
			return;
		}// end function
		
		public function toPoint() : Point
		{
			return new Point(x, y);
		}// end function
		
		public function round() : void
		{
			x = Math.round(x);
			y = Math.round(y);
			z = Math.round(z);
			return;
		}// end function
		
		public function equals(param1:Point3D, param2:Number = 0) : Boolean
		{
			return x - param1.x <= param2 && x - param1.x >= -param2 && y - param1.y <= param2 && y - param1.y >= -param2 && z - param1.z <= param2 && z - param1.z >= -param2;
		}// end function
		
		public static function cross(param1:Point3D, param2:Point3D) : Point3D
		{
			return new Point3D(param1.y * param2.z - param1.z * param2.y, param1.z * param2.x - param1.x * param2.z, param1.x * param2.y - param1.y * param2.x);
		}// end function
		
		public static function cross2D(param1:Point3D, param2:Point3D) : Number
		{
			return param1.x * param2.y - param1.y * param2.x;
		}// end function
		
		public static function angle(param1:Point3D, param2:Point3D) : Number
		{
			var _loc_3:* = Math.sqrt((param1.x * param1.x + param1.y * param1.y + param1.z * param1.z) * (param2.x * param2.x + param2.y * param2.y + param2.z * param2.z));
			var _loc_4:* = _loc_3 != 0 ? (dot(param1, param2) / _loc_3) : (1);
			return Math.acos(_loc_4);
		}// end function
		
		public static function average(param1:Point3D, param2:Point3D = null, param3:Point3D = null, param4:Point3D = null) : Point3D
		{
			if (param2 == null)
			{
				return param1.clone();
			}
			if (param3 == null)
			{
				return new Point3D((param1.x + param2.x) * 0.5, (param1.y + param2.y) * 0.5, (param1.z + param2.z) * 0.5);
			}
			if (param4 == null)
			{
				return new Point3D((param1.x + param2.x + param3.x) / 3, (param1.y + param2.y + param3.y) / 3, (param1.z + param2.z + param3.z) / 3);
			}
			return new Point3D((param1.x + param2.x + param3.x + param4.x) * 0.25, (param1.y + param2.y + param3.y + param4.y) * 0.25, (param1.z + param2.z + param3.z + param4.z) / 0.25);
		}// end function
		
		public static function random(param1:Number = 0, param2:Number = 0, param3:Number = 0, param4:Number = 0, param5:Number = 0, param6:Number = 0) : Point3D
		{
			return new Point3D(param1 + Math.random() * (param2 - param1), param3 + Math.random() * (param4 - param3), param5 + Math.random() * (param6 - param5));
		}// end function
		
		public static function interpolate(param1:Point3D, param2:Point3D, param3:Number = 0.5) : Point3D
		{
			return new Point3D(param1.x + (param2.x - param1.x) * param3, param1.y + (param2.y - param1.y) * param3, param1.z + (param2.z - param1.z) * param3);
		}// end function
		
		public static function dot(param1:Point3D, param2:Point3D) : Number
		{
			return param1.x * param2.x + param1.y * param2.y + param1.z * param2.z;
		}// end function
		
		public static function sum(param1:Point3D, param2:Point3D) : Point3D
		{
			return new Point3D(param1.x + param2.x, param1.y + param2.y, param1.z + param2.z);
		}// end function
		
		public static function dot2D(param1:Point3D, param2:Point3D) : Number
		{
			return param1.x * param2.x + param1.y * param2.y;
		}// end function
		
		public static function difference(param1:Point3D, param2:Point3D) : Point3D
		{
			return new Point3D(param1.x - param2.x, param1.y - param2.y, param1.z - param2.z);
		}// end function
		
		public static function angleFast(param1:Point3D, param2:Point3D) : Number
		{
			var _loc_3:* = dot(param1, param2);
			if (Math.abs(_loc_3) > 1)
			{
				_loc_3 = _loc_3 > 0 ? (1) : (-1);
			}
			return Math.acos(_loc_3);
		}// end function
		
	}
}
