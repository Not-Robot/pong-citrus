package  
{
	import citrus.core.CitrusEngine;
	import citrus.core.starling.StarlingState;
	import citrus.physics.box2d.Box2D;
	import starling.events.Event;
	import starling.display.Button;
	import starling.textures.Texture;
	
	/**
	 * ...
	 * @author Derek Carson
	 */
	public class PongGameState extends StarlingState 
	{
		private var _quitButton:Button;
		
		public function PongGameState() {
			super();
		}
		
		override public function initialize():void {
			super.initialize();
			
			var box2D:Box2D = new Box2D("box2D");
			box2D.visible = true;
			add(box2D);
			
			_quitButton = new Button(Texture.fromColor(100, 40, 0xFFFFFFFF), "Quit");
			_quitButton.pivotX = _quitButton.width / 2;
			_quitButton.pivotY = _quitButton.height / 2;
			_quitButton.x = stage.stageWidth - _quitButton.width;
			_quitButton.y = _quitButton.height;
			addChild(_quitButton);
			
			_quitButton.addEventListener(Event.TRIGGERED, quitGame);
		}
		
		private function quitGame(e:Event):void {
			trace("Quit game");
			CitrusEngine.getInstance().state = new WelcomeState();
		}
		
	}

}