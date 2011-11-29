package
{
	public class Remind
	{
		private var _title : String = "";
		private var _content : String = "";
		private var _owner : IRequester = null;
		private var _data : Object = null;
		private var _type : int = TASK;
		public static const NEWLIST : int = 0;
		public static const TASK : int = 1;
		public function Remind(t:String, c:String, owner : IRequester, data : Object, type : int )
		{
			this._title = t;
			this._content = c;
			this._owner = owner;
			this._data = data;
			this._type = type;
		}
		public function get title():String{
			return this._title;
		}
		public function get content():String{
			return this._content;
		}
		public function get data():Object{
			return this._data;
		}
		public function get owner():IRequester{
			return this._owner;
		}
		public function get type():int{
			return this._type;
		}
	}
}