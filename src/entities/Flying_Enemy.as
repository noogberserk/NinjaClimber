package entities 
{
	import net.flashpunk.Entity;
	
	/**
	 * ...
	 * @author noogberserk
	 */
	public class Flying_Enemy extends Entity 
	{
		private var g:Image;
		private var ascending:Boolean;
		private var player:Ninja;
		private var topHeight:Number;
		private var v:Point = new Point();
		public static MONSTER_SPEED_FOR_KILL = 1;
		
		public function Flying_Enemy(x:Number, y:Number) 
		{
			super(x, y);
		}
		
	}

}