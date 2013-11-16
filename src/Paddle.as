package  
{
	import citrus.objects.NapePhysicsObject;
	import nape.phys.BodyType;
	import starling.display.Quad;
	import starling.events.TouchEvent;
	
	/**
	 * ...
	 * @author Derek Carson
	 */
	public class Paddle extends NapePhysicsObject {
		private var _sprite:Quad;
		private var _position:uint;

		public function Paddle(name:String, params:Object=null) {
			_sprite = new Quad(params.width, params.height);
			super(name, params);
			_position = y;
		}
		
		override protected function createBody():void {
			super.createBody();
			view = _sprite;
		}
		
		override protected function defineBody():void {
			_bodyType = BodyType.KINEMATIC;
			_touchable = true;
			updateCallEnabled = true;
		}
		
		override protected function createMaterial():void {
			super.createMaterial();
			_material.staticFriction = 0;
			_material.dynamicFriction = 0;
			_material.elasticity = 1;
		}
		
		public function move(position:uint):void {
			_position = position;
		}
		
		override public function update(timeDelta:Number):void {
			super.update(timeDelta);
			var direction:int = _position - y;
			if (Math.abs(direction) > 5) {
				direction = direction > 0 ? 1 : -1;
				var distance:Number = y + direction * 300 * timeDelta;
				if (direction < 0) {
					if (distance + (direction * height / 2) > 0) {
						y = distance;
					} else {
						y = height / 2;
					}
				} else {
					if (distance + (direction * height / 2) < _ce.stage.stageHeight) {
						y = distance;
					} else {
						y = _ce.stage.stageHeight - height / 2;
					}
				}
			}
		}
	}

}
