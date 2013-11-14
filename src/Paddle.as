package  
{
	import citrus.objects.NapePhysicsObject;
	import nape.phys.BodyType;
	
	/**
	 * ...
	 * @author Derek Carson
	 */
	public class Paddle extends NapePhysicsObject 
	{
		
		public function Paddle(name:String, params:Object=null) 
		{
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