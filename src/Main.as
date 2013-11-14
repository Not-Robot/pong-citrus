package 
{
	import citrus.core.starling.StarlingCitrusEngine;
	import flash.events.Event;

	
	[SWF(framerate="60", backgroundColor="0x000000")]
	/**
	 * ...
	 * @author Derek Carson
	 */
	public class Main extends StarlingCitrusEngine 
	{
		
		public function Main():void {
			super();
		}
		
		override protected function handleAddedToStage(e:Event):void {
			super.handleAddedToStage(e);
			setUpStarling(true);
			state = new WelcomeState();
		}

// BOZO: want this in citrus 3.1.8, specifically for mobile
//		override public function handleStarlingReady():void {
//            state = new StarlingDemoGameState();
//        }
		
	}
	
}