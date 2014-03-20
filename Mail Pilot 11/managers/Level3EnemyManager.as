package managers
{
	import starling.core.Starling;

	import objects.Enemy;

	import states.Level3;

	public class Level3EnemyManager
	{

		private var play:Level3;
		public var enemies:Array;
		private var numEnemies:int = 5;

		public function Level3EnemyManager(play:Level3)
		{
			this.play = play;
			var count:int = 0;
			var enemy:Enemy;

			// create a new enemy array
			enemies = new Array();

			// add four enemies to the array
			while (count < numEnemies)
			{
				if (Math.random() < 0.05)
				{
					enemy = new Enemy();
					// add a new cloud to the cloud array
					enemies.push(enemy);

					Starling.juggler.add(enemy);

					// add a random cloud to the stage;
					play.addChild(enemies[count]);
					count++;
				}
			}
		}

		public function update():void
		{
			var enemy:Enemy;
			var len:int = enemies.length;

			for (var count:int=len-1; count >=0; count--)
			{
				enemy = enemies[count];
				enemy.y +=  enemy.speed;

				// check to see if Enemy has left the screen
				if (enemy.y > Starling.current.nativeStage.stageHeight + enemy.height)
				{
					resetEnemy(enemy);
				}
			}
		}

		public function resetEnemy(enemy:Enemy):void
		{
			// move enemy plane back to starting position off screen
			enemy.y =  -  enemy.height;
			enemy.x = Math.random() * Starling.current.nativeStage.stageWidth;
			enemy.speed = Math.random() * 5 + 6;
		}

		public function destroy():void
		{
			// clear the array
			enemies = null;
		}
	}

}