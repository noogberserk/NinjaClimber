package 
{
	import net.flashpunk.Engine;
	import net.flashpunk.FP;
	import flash.ui.Mouse;
	import net.flashpunk.utils.*;
	import worlds.GameWorld;
	import worlds.LaunchingWorld;
	/**
	 * ...
	 * @author noogberserk
	 */
	public class Main extends Engine
	{
		
		public function Main():void 
		{
			super(360, 240,60,true);
			FP.screen.scale = 2;
			FP.screen.color = 0x4d5750;
			FP.world = new LaunchingWorld();
			FP.console.enable();
			//Mouse.hide();
			
		}
		
		override public function update():void 
		{
			super.update();
		}
		
	}
	
}