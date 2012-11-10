package entities 
{
	import flash.display.BitmapData;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Image;
	/**
	 * ...
	 * @author noogberserk
	 */
	public class Jumping_Enemy_Spikes extends Jumping_Enemy 
	{
		private var timer:Number;
		private var g_exploding:Image;
		private var g_normal:Image;
		
		public function Jumping_Enemy_Spikes(x:Number, y:Number) 
		{
			super(x, y);
			timer = 0;
			g_exploding = new Image(new BitmapData(GC.JUMPING_ENEMY_HEIGHT, GC.JUMPING_ENEMY_WIDTH, false, 0x000000));
			g_normal = new Image(new BitmapData(GC.JUMPING_ENEMY_HEIGHT, GC.JUMPING_ENEMY_WIDTH, false));
		}
		override public function update():void 
		{
			super.update();
			timer += FP.elapsed;
			if (timer > 3) {
				graphic = g_exploding;
				timer -= 8;
			}
			else if (timer > 0) {
				graphic = g_normal;
			}
		}
	}

}