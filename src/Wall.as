package  
{
	import citrus.objects.NapePhysicsObject;
	import nape.phys.BodyType;
	
	/**
	 * ...
	 * @author Derek Carson
	 */
	public class Wall extends NapePhysicsObject 
	{
		
		public function Wall(name:String, params:Object=null) 
		{
			super(name, params);
			
		}
		
		override protected function createMaterial():void 
		{
			super.createMaterial();
			_material.staticFriction = 0;
			_material.dynamicFriction = 0;
			_material.elasticity = 1;
		}
		
		override protected function defineBody():void 
		{
			_bodyType = BodyType.STATIC;
		}
	}

}