package  
{
	import net.flashpunk.FP;
	/**
	 * ...
	 * @author noogberserk
	 */
	public class GC 
	{
		//GLOBAL CONSTANTS
		
		//Types
		public static const ALL_ENEMY_TYPES:Array= [TYPE_JUMPING_ENEMY,TYPE_FLYING_ENEMY];
		public static const TYPE_PLAYER:String = "player";
		public static const TYPE_JUMPING_ENEMY:String = "jumping_enemy";
		public static const TYPE_FLYING_ENEMY:String = "flying_enemy";
		
		
		//SPEEDS
		public static const GRAVITY:Number = 0.6;
		public static const HORIZONTAL_ACCELERATION:Number = 5;
		public static const HORIZONTAL_TOP_SPEED:uint = 50;
		public static const JUMP_SPEED:uint = 100;
		public static const DASH_SPEED:uint = 200;
		public static const MAX_INITIAL_ACCELERATION:Number = 0.1;
		
		//ENEMY SPEEDS
		public static const JUMPING_ENEMY_HSPEED:Number = 50;
		public static const JUMPING_ENEMY_VSPEED:Number = 100;
		
		
		
		//SIZES
		public static const PLAYER_WIDTH:uint = 20;
		public static const PLAYER_HEIGHT:uint = 20;
		public static const JUMPING_ENEMY_WIDTH:uint = 25;
		public static const JUMPING_ENEMY_HEIGHT:uint = 25;
		
		//LIMITS
		public static const LEVEL_HEIGHT_LIMIT:uint = 20;
		public static const LEVEL_LEFT_LIMIT:uint = FP.screen.width * (1/8);
		public static const LEVEL_RIGHT_LIMIT:uint = FP.screen.width - FP.screen.width * (1 / 8);
		
		
		//ASSETS
		[Embed(source = "lever.png")] public static const JUMPING_BAR_ASSET:Class;
		[Embed(source = "bar.png")] public static const LEVER_ASSET:Class;
		
	}

}