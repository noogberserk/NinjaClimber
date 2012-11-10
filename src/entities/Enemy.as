package entities 
{
	import net.flashpunk.Entity;
	
	/**
	 * ...
	 * @author noogberserk
	 */
	public class Enemy extends Entity 
	{
		public static var MONSTER_SPEED_FOR_KILL = 0;
		
		public function Enemy(x:Number, y:Number) 
		{
			super(x, y);
		}
		
	}

}