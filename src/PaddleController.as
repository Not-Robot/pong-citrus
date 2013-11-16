package  
{
	import starling.display.Sprite;
	import starling.events.Touch;
	import starling.events.TouchEvent;
	import starling.events.TouchPhase;
	
	/**
	 * ...
	 * @author Derek Carson
	 */
	public class PaddleController extends Sprite 
	{
		private var _paddle:Paddle;
		
		public function PaddleController(paddle:Paddle) {
			_paddle = paddle;
			super();
			_paddle.view.addEventListener(TouchEvent.TOUCH, onTouch);
		}
		
		private function onTouch(e:TouchEvent):void {
			var t:Touch = e.getTouch(_paddle.view);
			if (t && (t.phase != TouchPhase.ENDED && t.phase != TouchPhase.HOVER)) {
				_paddle.move(t.globalY);
				//trace("Dragging left paddle to "+t.globalY);
			} else if (t && t.phase == TouchPhase.ENDED) {
				_paddle.move(_paddle.y);
			}
		}
		
	}

}