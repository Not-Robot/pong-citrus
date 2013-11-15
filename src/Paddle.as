package  
{
	import citrus.objects.NapePhysicsObject;
	import starling.display.Quad;
	import nape.phys.BodyType;
	
	/**
	 * ...
	 * @author Derek Carson
	 */
	public class Paddle extends NapePhysicsObject 
	{
		private var _sprite:Quad;

		public function Paddle(name:String, params:Object=null) 
		{
			_sprite = new Quad(params.width, params.height);
			super(name, params);
		}
		
		override protected function createConstraint():void 
		{
			super.createConstraint();
		}
		
		override public function destroy():void 
		{
			super.destroy();
		}

		override protected function createBody():void {
			super.createBody();
			view = _sprite;
		}
		
		override protected function defineBody():void 
		{
			_bodyType = BodyType.KINEMATIC;
		}
		
		override protected function createMaterial():void 
		{
			super.createMaterial();
			_material.staticFriction = 0;
			_material.dynamicFriction = 0;
			_material.elasticity = 1;
		}
	}

}
