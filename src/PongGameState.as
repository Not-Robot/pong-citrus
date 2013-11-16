package  
{
	import citrus.core.CitrusEngine;
	import citrus.core.starling.StarlingState;
	import citrus.objects.NapePhysicsObject;
	import citrus.objects.platformer.nape.Sensor;
	import citrus.physics.nape.Nape;
	import flash.display.Stage;
	import nape.geom.Vec2;
	import nape.phys.Body;
	import nape.phys.BodyType;
	import nape.shape.Shape;
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
		private var _nape:Nape;
		
		public function PongGameState() {
			super();
		}
		
		override public function initialize():void {
			super.initialize();
			
			_nape = new Nape("nape", { gravity:new Vec2(0, 0) } );
			//_nape.visible = true;
			_nape.space.worldLinearDrag = 0;
			_nape.space.worldAngularDrag = 0;
			add(_nape);
			
			_quitButton = new Button(Texture.fromColor(100, 40, 0xFFFFFFFF), "Quit");
			_quitButton.pivotX = _quitButton.width / 2;
			_quitButton.pivotY = _quitButton.height / 2;
			_quitButton.x = stage.stageWidth - _quitButton.width;
			_quitButton.y = _quitButton.height;
			addChild(_quitButton);
			
			_quitButton.addEventListener(Event.TRIGGERED, quitGame);
			
			add(new Ball("ball", {radius: 10}));
			
			add(new Wall("Top", { x:_ce.stage.stageWidth / 2, y:-2, width:_ce.stage.stageWidth, height:4 } ));
			add(new Wall("Right", { x:_ce.stage.stageWidth + 2, y:_ce.stage.stageHeight / 2, width: 4, height:_ce.stage.stageHeight } ));
			add(new Wall("Bottom", { x:_ce.stage.stageWidth / 2, y:_ce.stage.stageHeight + 2, width: _ce.stage.stageWidth, height:4 } ));
			add(new Wall("Left", { x:-2, y:_ce.stage.stageHeight / 2, width: 4, height:_ce.stage.stageHeight } ));
			
			add(new Paddle("rightPaddle", { x:_ce.stage.stageWidth -10, y:_ce.stage.stageHeight / 2, width: 20, height: 100 } ));
			add(new Paddle("leftPaddle", { x:10, y:_ce.stage.stageHeight / 2, width: 20, height: 100 } ));
		}
		
		private function quitGame(e:Event):void {
			trace("Quit game");
			CitrusEngine.getInstance().state = new WelcomeState();
		}
		
	}

}
