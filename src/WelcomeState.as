package  
{
	import citrus.core.CitrusEngine;
	import citrus.core.starling.StarlingState;
	import starling.events.Event;
	import starling.display.BlendMode;
	import starling.display.Button;
	import starling.display.Sprite;
	import starling.text.TextField;
	import starling.textures.Texture;
	import starling.utils.HAlign;
	
	/**
	 * ...
	 * @author Derek Carson
	 */
	public class WelcomeState extends StarlingState {
		private var _welcomeMess:TextField;
		private var _soloButton:Button;
		private var _multiButton:Button;
		
		public function WelcomeState() {
			super();
		}
		
		override public function initialize():void {
			super.initialize();
			
			_welcomeMess = new TextField(300, 60, "Welcome to Pong", "Verdana", 20, 0xFFFFFFFF, true);
			_welcomeMess.pivotX = _welcomeMess.width / 2;
			_welcomeMess.y = 200;
			_welcomeMess.x = stage.stageWidth / 2;
			_welcomeMess.hAlign = HAlign.CENTER;
			addChild(_welcomeMess);
			
			_soloButton = new Button(Texture.fromColor(100, 40, 0xFFFFFFFF), "Solo");
			_soloButton.pivotX = _soloButton.width / 2;
			_soloButton.x = stage.stageWidth / 2;
			_soloButton.y = 300;
			addChild(_soloButton);
			
			_multiButton = new Button(Texture.fromColor(100, 40, 0xFFFFFFFF), "Multi-player");
			_multiButton.pivotX = _soloButton.width / 2;
			_multiButton.x = stage.stageWidth / 2;
			_multiButton.y = 400;
			addChild(_multiButton);
			
			_soloButton.addEventListener(Event.TRIGGERED, soloStart);
			_multiButton.addEventListener(Event.TRIGGERED, multiStart);
		}
		
		protected function soloStart(e:Event):void {
			trace("Start a solo game");
			_ce.state = new PongGameState(true);
		}
		
		protected function multiStart(e:Event):void {
			trace("Start a multi-player game");
			_ce.state = new PongGameState();
		}
		
	}

}
