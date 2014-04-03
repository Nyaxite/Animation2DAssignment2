/*
	Original code by: Tom Tsiliopoulos
	Edited by: Michael Burnie
	Description: Took the BulletManager and modified it for the third level.
*/
package managers
{
	import states.Level3;
	import objects.Bullet;

	public class Level3BulletManager
	{
		//set the current game state to level 3
		private var play:Level3;
		
		//createa  bullet array
		public var bullets:Array;
		public var count:int = 0;

		public function Level3BulletManager(play:Level3)
		{
			this.play = play;
			bullets = new Array();
		}

		public function update():void
		{
			var bullet:Bullet;
			var len:int = bullets.length;
			
			for (var count:int=len-1; count >=0; count--)
			{
				bullet = bullets[count];
				// start the bullet offstage
				bullet.y -=  25;
				// check to see if the bullet has left the stage
				if (bullet.y < 0)
				{
					destroyBullet(bullet);
				}
			}

			// check if the user has triggered the bullets to fire
			if ((play.fire == true) && (this.count % 10 == 0))
			{
				if (play.plane.onStage == true)
				{
					fire();//call the fire method
				}
			}

			this.count++;
		}

		private function fire():void
		{
			// create two bullets on either side of  plane
			var bullet:Bullet = new Bullet();
			play.addChild(bullet);
			bullet.x = play.plane.x - 40;
			bullet.y = 400;
			bullets.push(bullet);

			bullet = new Bullet();
			play.addChild(bullet);
			bullet.x = play.plane.x + 40;
			bullet.y = 400;
			bullets.push(bullet);

			// Play Bullet Sound
			Assets.bullet.play();
		}

		public function destroyBullet(bullet:Bullet):void
		{
			var len:int = bullets.length;

			// remove bullet from stage and from bullet array
			for (var count:int=0; count<len; count++)
			{
				if (bullets[count] == bullet)
				{
					bullets.splice(count, 1);
					bullet.removeFromParent(true);
				}
			}
		}

		public function destroy():void
		{
			// clear the bullet array
			bullets = null;
		}
	}

}