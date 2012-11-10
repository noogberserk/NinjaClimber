package entities 
{
	import adobe.utils.ProductManager;
	import flash.display.ActionScriptVersion;
	import flash.display.BitmapData;
	import flash.geom.Point;
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.FP;
	/**
	 * ...
	 * @author noogberserk
	 */
	public class Jumping_Enemy extends Entity 
	{
		private var g:Image;
		private var ascending:Boolean;
		private var player:Ninja;
		private var topHeight:Number;
		public var v:Point = new Point();
		public static var MONSTER_SPEED_FOR_KILL:int = 0;
		
		public function Jumping_Enemy(x:Number, y:Number) 
		{
			super(x, y);
			ascending = true;
			topHeight = FP.rand(10) + 50;
			
			if (x > FP.screen.width / 2) {
				v.x = -FP.rand(GC.JUMPING_ENEMY_HSPEED);
			}
			else {
				v.x = FP.rand(GC.JUMPING_ENEMY_HSPEED);
			}
			
			v.y = -(FP.rand(GC.JUMPING_ENEMY_VSPEED / 2) + GC.JUMPING_ENEMY_VSPEED / 1.3);
			
			g = new Image(new BitmapData(GC.JUMPING_ENEMY_HEIGHT, GC.JUMPING_ENEMY_WIDTH, true));
			graphic = g;
			type = GC.TYPE_JUMPING_ENEMY;
			setHitbox(GC.JUMPING_ENEMY_WIDTH, GC.JUMPING_ENEMY_HEIGHT);
		}
		override public function update():void 
		{
			super.update();
			player = collide(GC.TYPE_PLAYER, x, y) as Ninja;
			
			v.y += GC.GRAVITY;
			
			x += v.x * FP.elapsed;
			y += v.y * FP.elapsed;
			
			if (y > FP.screen.height + 30) {
				FP.world.remove(this);
			}
		}
	}

}