package 
{
	import mx.controls.List;
	import mx.core.EdgeMetrics;
	
	public class MyList extends List
	{
		public function MyList()
		{
			super();
		}
		
		override public function get viewMetrics():EdgeMetrics
		{
			var _v : EdgeMetrics = this.viewMetrics;
			if (verticalScrollBar && verticalScrollBar.visible)
				_v.right = 5;
			return _v;
		}
	}
}