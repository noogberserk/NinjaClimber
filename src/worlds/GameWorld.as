package worlds 
{
	import entities.Jumping_Enemy_Spikes;
	import entities.LaunchingBar;
	import entities.Ninja;
	import net.flashpunk.Graphic;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.World;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Text;
	
	/**
	 * ...
	 * @author noogberserk
	 */
	public class GameWorld extends World 
	{
		//entities
		private var player:Ninja;
		private var blockArray:Array = new Array();
		
		//HUD
		private var timer:Number;
		private var heightText:Text;
		private var lifeText:Text;
		private var lavaLevelText:Text;
		private var levelVelocityText:Text;	
		private var timeText:Text;
		
		public function GameWorld(initialVelocityPercentage:Number) 
		{
			player = new Ninja(initialVelocityPercentage, FP.screen.width / 2, FP.screen.height);
			Text.size = 8;
			heightText = new Text("", 4, 10);
			lifeText = new Text("", FP.screen.width / 2, 4);
			lavaLevelText = new Text("", 4, FP.screen.height - 30);
			levelVelocityText = new Text("", 4, 20);
			timeText = new Text("", FP.screen.width - 90, 10);
			startLevel();
		}
		
		override public function update():void 
		{
			super.update();
			
			updateHUD();
			GV.GAMEPLAY_TIME += FP.elapsed
			
			timer += FP.elapsed;
			if (timer > 1) {
				if (blockArray.length > 0) {
					add(blockArray.pop());
				}
				timer -= 1
			}
			
			trace(GV.LEVEL_ACCELERATION);
			GV.LEVEL_ACCELERATION -= GV.FRICTION * FP.elapsed;
			if (GV.LEVEL_ACCELERATION < 0) {
				GV.LEVEL_ACCELERATION = 0;
			}
			trace(GV.LEVEL_ACCELERATION);
			
			GV.LEVEL_VELOCITY += GV.LEVEL_ACCELERATION * FP.elapsed;
			GV.HEIGHT += GV.LEVEL_VELOCITY * FP.elapsed;
			
			if (GV.GAMEPLAY_TIME > 30) {
				GV.LAVA_ACCELERATION = 0.15;
			}
			else if (GV.GAMEPLAY_TIME > 60) {
				GV.LAVA_ACCELERATION = 0.2;
			}
			else if (GV.GAMEPLAY_TIME > 100) {
				GV.LAVA_ACCELERATION = 0.25;
			}
			
			if (GV.GAMEPLAY_TIME > 10) {
				GV.LAVA_VELOCITY += GV.LAVA_ACCELERATION * FP.elapsed;
				GV.LAVA_LEVEL += GV.LAVA_VELOCITY * FP.elapsed;
			}
			//trace("velocity: " + GV.LAVA_VELOCITY);
			//trace("acceleration:" + GV.LAVA_ACCELERATION);
			
			if (blockArray.length == 0) {
				for (var i:uint = 0; i < 10; i++) {
					blockArray.push(new Jumping_Enemy_Spikes(i * 25, FP.screen.height + 30));
				}
			}
		}
		
		public function startLevel():void 
		{
			add(player);
			addGraphic(heightText);
			addGraphic(lavaLevelText);
			addGraphic(lifeText);
			addGraphic(levelVelocityText);
			addGraphic(timeText);
			
			for (var i:uint = 0; i < 10; i++) {
				blockArray.push(new Jumping_Enemy_Spikes(i * 25, FP.screen.height + 30));
			}
			timer = 0;
			
		}
		
		private function updateHUD():void
		{
			heightText.text = "Height: " + GV.HEIGHT.toString() + "m";
			lavaLevelText.text = "Lava Level: " + GV.LAVA_LEVEL.toString();
			lifeText.text = "Lives: " + GV.LIFE.toString();
			levelVelocityText.text = "Speed: " + GV.LEVEL_VELOCITY.toString() + "m/s";
			timeText.text = "Total Time: " + GV.GAMEPLAY_TIME.toString() + "s";
		}
	}

}