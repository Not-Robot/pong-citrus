package 
{
	import citrus.core.starling.StarlingCitrusEngine;
	import flash.events.Event;

	
	[SWF(framerate="60")]
	/**
	 * ...
	 * @author Derek Carson
	 */
	public class Main extends StarlingCitrusEngine 
	{
		
		public function Main():void {
		}
		
		override protected function handleAddedToStage(e:Event):void {
			super.handleAddedToStage(e);
			setUpStarling(true);
			state = new PongGameState();
		}

// BOZO: want this in citrus 3.1.8, specifically for mobile
//		override public function handleStarlingReady():void {
//            state = new StarlingDemoGameState();
//        }
		
	}
	
}