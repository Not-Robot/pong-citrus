package  
{
	import starling.text.TextField;
	import starling.utils.HAlign;
	import starling.utils.VAlign;
	
	
	/**
	 * ...
	 * @author Derek Carson
	 */
	public class Scoreboard extends TextField {
		
		public function Scoreboard() {
			super(100, 40, "0 | 0", "Verdana", 22, 0xFFFFFF, false);
			this.pivotX = this.width / 2;
			this.pivotY = this.height / 2;
			this.hAlign = HAlign.CENTER;
			this.vAlign = VAlign.CENTER;
		}
	}

}