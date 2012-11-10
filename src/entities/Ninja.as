package entities 
{
	import flash.display.BitmapData;
	import flash.geom.Point;
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.utils.*;
	import net.flashpunk.FP;
	
	/**
	 * ...
	 * @author noogberserk
	 */
	public class Ninja extends Entity 
	{
		private var g:Image;
		private var v:Point = new Point();
		private var previousX:Number;
		private var previousY:Number;
		private var b:Entity;
		private var ascending:Boolean;
		
		public function Ninja(initialVelocityPercentage:Number,x:Number,y:Number) 
		{
			super(x, y);
			g = new Image(new BitmapData(GC.PLAYER_WIDTH, GC.PLAYER_HEIGHT, true));
			//g.centerOrigin();
			graphic = g;
			type = GC.TYPE_PLAYER;
			setHitbox(GC.PLAYER_WIDTH, GC.PLAYER_HEIGHT)//, originX+3, originY+4);
			ascending = false;
			v.y = -GC.JUMP_SPEED * 1.5;
			GV.LEVEL_ACCELERATION = initialVelocityPercentage * GC.MAX_INITIAL_ACCELERATION;
			
		}
		override public function update():void 
		{
			super.update();
			
			//storing previous position for collision updating
			previousX = x;
			previousY = y;
			
			//CHECKING FOR INPUT
			if (!Input.check(Key.LEFT) && !Input.check(Key.RIGHT)) {
				//LOWERING SPEED TO 0
				if (v.x > 0) {
					v.x -= GC.HORIZONTAL_ACCELERATION;
				}
				if (v.x < 0) {
					v.x += GC.HORIZONTAL_ACCELERATION;
				}
				//v.x = 0;
			}
			//PLAYER ONLY MOVES ALONG X IF IT IS BETWEEN THE LIMITS
			if (Input.check(Key.LEFT)) {
				if (x > GC.LEVEL_LEFT_LIMIT) {
					v.x -= GC.HORIZONTAL_ACCELERATION;
				}
			}
			if (Input.check(Key.RIGHT)) {
				if (x < GC.LEVEL_RIGHT_LIMIT) {
					v.x += GC.HORIZONTAL_ACCELERATION;
				}
			}
			
			if (Input.check(Key.UP)) {
				v.y = -GC.JUMP_SPEED;
				ascending = true;
			}
			if (Input.pressed(Key.DOWN)) {
				v.y = GC.DASH_SPEED;
				ascending = false;
			}
			
			
			//Calculate difference in position and move.
			v.y += GC.GRAVITY;
			
			
			//CHECK MAX SPEED
			if (v.x > GC.HORIZONTAL_TOP_SPEED) {
				v.x = GC.HORIZONTAL_TOP_SPEED;
			}
			if (v.x < -GC.HORIZONTAL_TOP_SPEED) {
				v.x = -GC.HORIZONTAL_TOP_SPEED;
			}
			
			if (y > FP.screen.height + 20) {
				v.y = -GC.DASH_SPEED;
				GV.LAVA_LEVEL += 10;
			}
			
			//UPDATE COORDINATES
			x += v.x * FP.elapsed;
			y += v.y * FP.elapsed;
			
			if (v.y > 0) ascending = false;
			
			//Check for collision
			b = collideTypes(GC.ALL_ENEMY_TYPES, x, y);
			
			//Player can't go past this limit
			if (y < GC.LEVEL_HEIGHT_LIMIT) {
				y = previousY;
			}
			
			if (!ascending) {
				if (b) {
					x = previousX;
					y = previousY;
					
					v.y = -GC.JUMP_SPEED;
					
					ascending = true;
					
					GV.LEVEL_ACCELERATION += GV.BASE_SPEED_FOR_KILL;
					
					FP.world.remove(b);
				}
			}
			
			
		}
	}

}