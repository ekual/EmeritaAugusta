package utils
{
	import flash.utils.Dictionary;

	public class DataManager
	{
			//un diccionario para mantener la relacion string-data
			private static var _data:Dictionary = new Dictionary();
			
			//devuelve el objeto data associado a la frase key
			public static function getData(key:String):* {
				return _data[key];
			}
			//registra el objecto data con una cadena
			public static function registerData(key:String, data:*):void{
				 _data[key] = data;
			}
			
			//unregisters a key string
			public static function unregisterData(key:String):void
			{
				delete _data[key];	
			}
			//unregister all key string
			public static function clearData():void {
				for (var key:String in _data) {
					delete _data[key];
			}
			
		}
	}
}