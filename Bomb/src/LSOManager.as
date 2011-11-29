package
{
	import flash.events.NetStatusEvent;
	import flash.net.SharedObject;
	import flash.net.SharedObjectFlushStatus;
	import flash.system.Security;
	import flash.system.SecurityPanel;
	
	public class LSOManager
	{
		public static const LOCATION : String = "TaskSchedulerForInputMethod";
		public function LSOManager()
		{
		}
		
		private static var pendingObject : Object = null;
		private static var flashObject : SharedObject = SharedObject.getLocal(LOCATION);
		public static function save():void{
//			flashObject.data.userPref = obj;
			try{
				var result : String = flashObject.flush();//保留之处，放大SIZE
				if (result == SharedObjectFlushStatus.PENDING){
					//空间不足，提示用户扩展空间
					pendingObject = flashObject;
					flashObject.addEventListener(NetStatusEvent.NET_STATUS, onStatus);
				}else if(result == SharedObjectFlushStatus.FLUSHED){
					//成功保存
					//通知外界
				}
			} catch(e:Error){
				//表示用户把本地保存数据设置为 “NEVER”
				//提醒用户修改数据存储选项卡
				Security.showSettings(SecurityPanel.LOCAL_STORAGE);
			}
		}
		
		/**
		 * 未来优化考虑：每一次读之前查看一下大小和内容，避免出现溢出
		 * */
		public static function read():Object{
			if (!flashObject.data.userPref){
				flashObject.data.userPref = new Object;
				flashObject.flush();
			}
			return flashObject.data.userPref;
		}
		
		private static function onStatus(e : NetStatusEvent) : void{
			if (e.info.code == "SharedObject.Flush.Success"){
				//说明用户同意扩展数据空间
				if (pendingObject != null){
					save();
					pendingObject = null;
				}
			}else if (e.info.code == "SharedObject.Flush.Failed"){
				//用户拒绝，提示用户非常遗憾无法存储更多的歌曲
			}
			flashObject.removeEventListener(NetStatusEvent.NET_STATUS, onStatus);
		}
		
	}
}
