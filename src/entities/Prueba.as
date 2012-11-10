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
	public class Prueba extends Entity 
	{
		private var g:Image;
		private var v:Point = new Point();
		private var previousX:Number;
		private var previousY:Number;
		private var acc:int;
		
		public function Prueba(x:Number,y:Number) 
		{
			super(x, y);
			g = new Image(new BitmapData(GC.PLAYER_WIDTH, GC.PLAYER_HEIGHT, true));
			//g.centerOrigin();
			graphic = g;
			type = GC.TYPE_PLAYER;
			setHitbox(GC.PLAYER_WIDTH, GC.PLAYER_HEIGHT)//, originX+3, originY+4);
		}
		override public function update():void 
		{
			super.update();
			
			if (Input.check(Key.LEFT)) {
				v.x -= 10;
			}
			if (Input.check(Key.RIGHT)) {
				v.x += 10;
			}
			
			x += v.x * FP.elapsed;
		}
	}

}