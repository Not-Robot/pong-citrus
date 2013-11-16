package  
{
	import citrus.core.CitrusObject;
	import starling.display.Sprite;
	
	/**
	 * ...
	 * @author Derek Carson
	 */
	public class AIController extends CitrusObject {
		private var _paddle:Paddle;
		private var _ball:Ball;
		
		public function AIController(paddle:Paddle, ball:Ball) {
			super("AIController");
			_paddle = paddle;
			_ball = ball;
			updateCallEnabled = true;
		}
		
		override public function update(timeDelta:Number):void {
			super.update(timeDelta);
			_paddle.move(_ball.y);
		}
		
	}

}