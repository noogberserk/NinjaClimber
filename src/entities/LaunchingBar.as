package entities 
{
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.FP;
	import worlds.GameWorld;
	import net.flashpunk.utils.*;
	
	/**
	 * ...
	 * @author noogberserk
	 */
	public class LaunchingBar extends Entity 
	{
		private var jumpingBar:Image;
		private var lever:Image;
		private var ascending:Boolean;
		private var lever_acceleration:Number = 60;
		private var lever_velocity:Number = 10;
		private var isMoving:Boolean;
		private var initialVelocityPercentage:Number;
		
		public function LaunchingBar() 
		{
			//loading assets
			jumpingBar = new Image(GC.JUMPING_BAR_ASSET);
			lever = new Image(GC.LEVER_ASSET);
			lever.color = 0xFFFFFF;
			//positions.
			jumpingBar.x = 20;
			jumpingBar.y = FP.screen.height - jumpingBar.height - 30;
			lever.x = jumpingBar.x;
			lever.y = (jumpingBar.y - 6) + jumpingBar.height;
			
			ascending = true;
			isMoving = true;
			
			addGraphic(jumpingBar);
			addGraphic(lever);
			
			
		}
		override public function update():void 
		{
			super.update();
			
			if (isMoving){
				lever_velocity += lever_acceleration * FP.elapsed;
				
				if (lever.y < jumpingBar.y) {
					ascending = false;
					lever_acceleration = -60;
				}
				if (lever.y > (jumpingBar.y - 6) + jumpingBar.height) {
					ascending = true;
					lever_velocity = 10;
					lever_acceleration = 60;
				}
				
				if (ascending) {
					lever.y -= lever_velocity * FP.elapsed;
				}
				else {
					lever.y += lever_velocity * FP.elapsed;
				}
				
				if (Input.pressed(Key.DOWN)) {
					isMoving = false;
					//VELOCITY PERCENTAGE AT INITIAL JUMP.
					initialVelocityPercentage = 1 - (lever.y - jumpingBar.y) / jumpingBar.height;
					trace(initialVelocityPercentage);
					FP.world = new GameWorld(initialVelocityPercentage);
				}
			}
			
		}
	}

}