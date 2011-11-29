package
{
	import flash.filters.DropShadowFilter;
	import flash.text.TextField;
	import flash.text.TextFormat;
	
	import mx.containers.Canvas;
	import mx.controls.Label;
	import mx.controls.ToolTip;
	import mx.core.Application;
	import mx.core.FlexSprite;
	import mx.core.IToolTip;
	import mx.core.UIComponent;
	import mx.core.UITextField;
	
	public class MyTooltip extends Canvas implements IToolTip
	{
		private var wrapper : UIComponent = new UIComponent;
		private var _text : TextField = new TextField;
		public function MyTooltip()
		{
			super();
			this.mouseChildren = false;
			this.mouseEnabled = false;
			this.filters=[new DropShadowFilter()];
			this.wrapper.setStyle("paddingTop", "0");
			this.setStyle("paddingBottom", "0");
			this.setStyle("paddingLeft", "0");
			this.setStyle("paddingRight", "0");
			this.setStyle("borderStyle", "none");
			this.setStyle("backgroundColor", "black");
			this.wrapper.mouseChildren = false;
			this.wrapper.mouseEnabled = false;
//			this.wrapper.setStyle("width", "100%");
//			this.wrapper.setStyle("height", "100%");
//			
//			this.wrapper.setStyle("horizontalScrollPolicy", "off");
//			this.wrapper.setStyle("verticalScrollPolicy", "off");
			this.addChild(wrapper);
			this._text.text = "   ";
			this._text.width = 150;
			this._text.height = 100;
			this._text..multiline = true;
			this._text.wordWrap = true;
			this._text.defaultTextFormat = new TextFormat(null, 12, 0xFFFFFF);
			this._text.mouseEnabled = false;
			this.wrapper.addChild(this._text);
		}
		public function setTooltip(str:String):void{
			this._text.text = str;
			trace(this._text.textWidth + ", " + this._text.textHeight);
			//this.setActualSize(this._text.textWidth, this._text.textHeight);
			super.width = this._text.textWidth + 5;
			super.height = this._text.textHeight + 8;
		}
		
		public function set text(str:String):void{
			setTooltip(str);
		}
		public function get text():String{
			return this._text.text;
		}
		override public function set width(w : Number):void{
			super.width = w;
			this._text.width = w;
		}
		override public function set height(h:Number):void{
			super.height = h;
			this._text.height = h;
		}
		
	}
}