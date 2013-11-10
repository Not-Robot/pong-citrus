package  
{
	import citrus.core.starling.StarlingState;
	import citrus.physics.box2d.Box2D;
	
	/**
	 * ...
	 * @author Derek Carson
	 */
	public class PongGameState extends StarlingState 
	{
		
		public function PongGameState() {
			super();
		}
		
		override public function initialize():void {
			super.initialize();
			
			var box2D:Box2D = new Box2D("box2D");
			box2D.visible = true;
			add(box2D);
		}
		
	}

}