package
{
	import flash.media.Sound;
	import flash.net.URLRequest;
	
	import mx.core.SoundAsset;
	import mx.effects.SoundEffect;

	public class RemindSound
	{
		[Embed(source="alarm.mp3")]
		public var MSG:Class;
		private static var _rs : RemindSound = new RemindSound();
		private var eSound :SoundAsset ;
//		private var sound : Sound;
		public function RemindSound()
		{
			
			eSound = new MSG() as SoundAsset; 
//			this.sound = new Sound(new URLRequest("msg.mp3"));
			
		}
		private static function getInstance():RemindSound{
			return _rs;
		}
		public static function alarm():void{
			getInstance().eSound.play(0);
		}
	}
}