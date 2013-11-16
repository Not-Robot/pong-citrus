package  
{
	import citrus.core.starling.StarlingState;
	import citrus.objects.APhysicsObject;
	import citrus.objects.platformer.nape.Sensor;
	import citrus.physics.nape.Nape;
	import nape.callbacks.InteractionCallback;
	import nape.geom.Vec2;
	import starling.display.Button;
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.events.Touch;
	import starling.events.TouchEvent;
	import starling.events.TouchPhase;
	import starling.textures.Texture;
	import starling.utils.getNextPowerOfTwo;
	
	/**
	 * ...
	 * @author Derek Carson
	 */
	public class PongGameState extends StarlingState {
		private var _quitButton:Button;
		private var _nape:Nape;
		private var _scoreBoard:Scoreboard;
		private var _ball:Ball;
		private var _leftScore:uint;
		private var _rightScore:uint;
		private var _rightPaddle:Paddle;
		private var _leftPaddle:Paddle;
		private var _hasAI:Boolean;
		
		public function PongGameState(hasAI:Boolean=false) {
			super();
			_hasAI = hasAI;
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
			
			_ball = new Ball("ball", {radius: 10})
			add(_ball);
			
			add(new Wall("Top", { x:_ce.stage.stageWidth / 2, y: -2, width:_ce.stage.stageWidth, height:4 } ));
			add(new Wall("Bottom", { x:_ce.stage.stageWidth / 2, y:_ce.stage.stageHeight + 2, width: _ce.stage.stageWidth, height:4 } ));
			
			var rightWall:Sensor = new Sensor("Right", { x:_ce.stage.stageWidth + 4, y:_ce.stage.stageHeight / 2, width: 4, height:_ce.stage.stageHeight } );
			add(rightWall);
			rightWall.onBeginContact.add(onRightLoss);
			var leftWall:Sensor = new Sensor("Left", { x: -4, y:_ce.stage.stageHeight / 2, width: 4, height:_ce.stage.stageHeight } );
			add(leftWall);
			leftWall.onBeginContact.add(onLeftLoss);
			
			_rightPaddle = new Paddle("rightPaddle", { x:_ce.stage.stageWidth -10, y:_ce.stage.stageHeight / 2, width: 20, height: 100 } )
			add(_rightPaddle);
			_leftPaddle = new Paddle("leftPaddle", { x:10, y:_ce.stage.stageHeight / 2, width: 20, height: 100 } );
			add(_leftPaddle);
			
			_scoreBoard = new Scoreboard();
			_scoreBoard.x = _ce.stage.stageWidth / 2;
			_scoreBoard.y = 20;
			addChild(_scoreBoard);
			_leftScore = 0;
			_rightScore = 0;
			updateScore();
			
			var lPCtl:PaddleController = new PaddleController(_leftPaddle);
			addChild(lPCtl);
			
			if (_hasAI) {
				var rAICtl:AIController = new AIController(_rightPaddle, _ball);
				add(rAICtl);
			} else {
				var rPCtl:PaddleController = new PaddleController(_rightPaddle);
				addChild(rPCtl);
			}
			
		}
		
		private function startPoint():void {
			_ball.x = _ce.stage.stageWidth / 2;
			_ball.y = _ce.stage.stageHeight / 2;
		}
		
		private function onRightLoss(cEvt:InteractionCallback):void {
			trace("Right lost point.");
			_rightScore += 1;
			updateScore();
			checkWin();
			startPoint();
		}
		
		private function onLeftLoss(cEvt:InteractionCallback):void {
			trace("Left lost point.");
			_leftScore += 1;
			updateScore();
			checkWin();
			startPoint();
		}
				
		private function checkWin():void {
			if (_leftScore > 4 || _rightScore > 4) {
				_ce.state = new WelcomeState();
			}
		}
		
		private function quitGame(e:Event):void {
			trace("Quit game");
			_ce.state = new WelcomeState();
		}
		
		private function updateScore():void {
			_scoreBoard.text = _leftScore + " | " + _rightScore;
		}
	}
}
