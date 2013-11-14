package  
{
	import citrus.core.CitrusEngine;
	import citrus.objects.NapePhysicsObject;
	import nape.geom.Vec2;
	import nape.phys.Body;
	
	/**
	 * ...
	 * @author Derek Carson
	 */
	public class Ball extends NapePhysicsObject 
	{
		
		public function Ball(name:String) 
		{
			super(name, {radius:10});
		}
		
		override public function addPhysics():void 
		{
			super.addPhysics();
		}
		
		override protected function createMaterial():void 
		{
			super.createMaterial();
			_material.staticFriction = 0;
			_material.dynamicFriction = 0;
			_material.elasticity = 1;
		}
		
		override protected function createBody():void 
		{
			super.createBody();
			_body.position.setxy(CitrusEngine.getInstance().stage.stageWidth / 2, CitrusEngine.getInstance().stage.stageHeight / 2);
			_body.velocity.set(Vec2.get(150, 150));
		}
	}

}