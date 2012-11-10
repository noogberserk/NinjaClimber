package  
{
	/**
	 * ...
	 * @author noogberserk
	 */
	public class GV 
	{
		//GLOBAL VARIABLES
		
		//Player HP
		public static var LIFE:uint = 3;
		//Meters up the tower
		public static var HEIGHT:Number = 0;
		//Meters at which the lava is now.
		public static var LAVA_LEVEL:Number = 0;
		//How fast is lava going up
		public static var LAVA_VELOCITY:Number = 1;
		//How fast is lava accelerating
		public static var LAVA_ACCELERATION:Number = 0.1;
		//How much meters per second is the player going up.
		public static var LEVEL_VELOCITY:Number = 1;
		//
		public static var LEVEL_ACCELERATION:Number;
		//Each monster slain gives a non-fixed amount of speed depending on monster, starting at this number.
		public static var BASE_SPEED_FOR_KILL:Number = 0.01;
		//Each monster slain gives a bonus speed depending on bonus bar
		public static var BONUS_SPEED_FOR_KILL:Number = 0;
		//Friction. Speed deceleration over time. 
		public static var FRICTION:Number = 0.01;
		//total time
		public static var GAMEPLAY_TIME:Number = 0;
	}

}