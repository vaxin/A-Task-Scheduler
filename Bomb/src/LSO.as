package
{
	
	import flash.external.ExternalInterface;
	import flash.utils.Dictionary;
	import flash.utils.Timer;
	/**
	 *
	 *  LSO提供基于Flash的本地化存储方案
	 *  @author dengfanxin@sogou-inc.com
	 *
	 * */
	public class LSO
	{
		public function LSO()
		{
		}
		
		/*********LSO Manager******************/
		private var flashObject : Object = null;
		public function getMapValue( key : String):Object{
			var map : Dictionary = readObject().map;
			if (key in map){
				return map[key];
			}else{
				return null;
			}
		}
		
		public function putMapValue( key : String, value:Object):void{
			var map : Dictionary = readObject().map;
			map[key] = value;
		}
		
		public function readObject():Object{
			if (flashObject != null) return flashObject;
			flashObject = LSOManager.read();
			//flashObject.data.userPref.map = new Dictionary;
			return flashObject;
		}
		
		public function put(obj : Object, save : Boolean = false):void{
			var object : Object = readObject();
			object.detail = obj;
			if (save){
				this.save();
			}
		}
		
		public function save():void{
			LSOManager.save();
		}
		
		
		public function get():Object{
			var object : Object = readObject();
			if (!object.detail)
				object.detail = new Object;
			return readObject().detail;
		}
	}
}
