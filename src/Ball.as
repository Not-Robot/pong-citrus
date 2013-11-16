package  
{
	import citrus.core.CitrusEngine;
	import citrus.objects.NapePhysicsObject;
	import starling.display.Quad;
	import nape.geom.Vec2;
	import nape.phys.Body;
	
	/**
	 * ...
	 * @author Derek Carson
	 */
	public class Ball extends NapePhysicsObject {
		private var _sprite:Quad;
		
		public function Ball(name:String, params:Object) {
			_sprite = new Quad(params.radius * 2, params.radius * 2);
			super(name, params);
		}
		
		override public function addPhysics():void {
			super.addPhysics();
		}
		
		override protected function createMaterial():void {
			super.createMaterial();
			_material.staticFriction = 0;
			_material.dynamicFriction = 0;
			_material.elasticity = 1;
		}
		
		override protected function createBody():void {
			super.createBody();
			view = _sprite;
			_body.position.setxy(_ce.stage.stageWidth / 2, _ce.stage.stageHeight / 2);
			_body.velocity.set(Vec2.get(150, 150));
		}
	}
}
