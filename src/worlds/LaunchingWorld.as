package worlds 
{
	import entities.LaunchingBar;
	import net.flashpunk.graphics.Text;
	import net.flashpunk.World;
	import net.flashpunk.FP;
	/**
	 * ...
	 * @author noogberserk
	 */
	public class LaunchingWorld extends World
	{
		private var launchingLever:LaunchingBar;
		private var infoText:Text;
		
		public function LaunchingWorld() 
		{
			launchingLever = new LaunchingBar();
			infoText = new Text("Press Down to Launch the Ninja", FP.screen.width / 2 - 50, 20);
			infoText.size = 8;
			addGraphic(infoText);
			add(launchingLever);
		}
		
	}

}