/*
	Original code by: Tom Tsiliopoulos
	Edited by: Michael Burnie
	Description: Took the level2CollisionManager and modified it for the third level.
*/
package managers
{
	import states.Level3;

	import objects.Meteor;
	import objects.Island;
	import objects.Plane;
	import objects.Coin;
	import objects.Bullet;
	import objects.Enemy;

	import flash.geom.Point;
	import flash.media.Sound;
	import flash.media.SoundChannel;
	import flash.events.Event;
	import flash.utils.Timer;
	import flash.events.TimerEvent;

	import starling.core.Starling;
	import starling.events.Event;

	public class Level3CollisionManager
	{
		// declare reference to Game Class
		private var play:Level3;

		// declare 2 points
		private var p1:Point = new Point();
		private var p2:Point = new Point();
		private var channel:SoundChannel = new SoundChannel();
		private var flickerOnTimer:Timer;
		private var flickerOffTimer:Timer;
		private var delayTimer:Timer;

		public function Level3CollisionManager(play:Level3)
		{
			// pass a reference to the game class
			this.play = play;
		}

		public function update():void
		{
			// on update check if either collision occurs
			if (play.plane.onStage == true)
			{
				planeAndMeteor();
				planeAndCoin();
				planeAndEnemy();
				// if a bullet has fired check if an enemy is hit
				if (play.fire == true)
				{
					bulletAndEnemy();
				}
			}
		}

		private function planeAndMeteor():void
		{
			var meteor:Meteor;
			var meteors:Array = play.meteorManager.meteors;
			var plane:Plane = play.plane;
			var len:int = meteors.length;
			
			// check collisions with the plane and each meteor
			for (var count:int = len-1; count>=0; count--)
			{
				// set our local meteor object to each meteor from the meteor array
				meteor = meteors[count];

				p1.x = plane.x;
				p1.y = plane.y;
				p2.x = meteor.x;
				p2.y = meteor.y;

				// Check the distance between the meteor and the plane
				if (Point.distance(p1,p2) < (meteor.height*0.5) + (plane.height*0.5) )
				{
					// Show Plane Explosion
					planeExplode(plane);
					// Subtract a life when the Plane is hit;
					play.lives.subtractLives(1);
					// Check if any lives are left;
					checkLives();
				}
			}
		}

		private function planeExplode(plane:Plane):void
		{
			// display the explosion animation
			play.explosionManager.spawn(plane.x,plane.y);

			// remove the ship image;
			plane.alpha = 0;
			plane.onStage = false;

			// play the explosion sound
			channel = Assets.explosion.play();
			channel.addEventListener(Event.SOUND_COMPLETE, explosionComplete);
		}

		private function checkLives():void
		{
			// if not enough lives then it's game over
			if (parseInt(play.lives.value.text) < 1)
			{
				play.game.changeState(Game.GAME_OVER_STATE);
			}
		}

		private function explosionComplete(event:Event):void
		{
			flickerOnTimer = new Timer(500,1);
			flickerOnTimer.addEventListener(TimerEvent.TIMER_COMPLETE, flickerPlaneOn);
			flickerOnTimer.start();
		}

		private function flickerPlaneOn(event:TimerEvent):void
		{
			// show the plane with 50% transparency for half a second
			play.plane.alpha = .5;
			flickerOffTimer = new Timer(500,1);
			flickerOffTimer.addEventListener(TimerEvent.TIMER_COMPLETE, flickerPlaneOff);
			flickerOffTimer.start();
		}

		private function flickerPlaneOff(event:TimerEvent):void
		{
			// hide the plane for half a second
			play.plane.alpha = 0;
			delayTimer = new Timer(500,1);
			delayTimer.addEventListener(TimerEvent.TIMER_COMPLETE, newPlane);
			delayTimer.start();
		}

		private function newPlane(event:TimerEvent):void
		{
			// show the plane and make it vulnerable again
			play.plane.alpha = 1;
			play.plane.onStage = true;
		}

		private function planeAndCoin():void
		{
			var coin:Coin = play.coin;
			var plane:Plane = play.plane;

			p1.x = plane.x;
			p1.y = plane.y;
			p2.x = coin.x;
			p2.y = coin.y;

			// Check the distance between the island and the plane
			if (Point.distance(p1,p2) < (coin.height*0.5) + (plane.height*0.5))
			{
				Assets.coin.play();
				// add 100 points every time the Plane passes over the Island;
				play.score.addScore(100);
				coin.alpha = 0;
				coin.onStage = false;
			}
		}

		private function planeAndEnemy():void
		{
			var enemies:Array = play.enemyManager.enemies;
			var plane:Plane = play.plane;
			var enemy:Enemy;
			var len:int = enemies.length;
			
			for (var count:int = len-1; count>=0; count--)
			{
				enemy = enemies[count];
				p1.x = play.plane.x;
				p1.y = play.plane.y;
				p2.x = enemy.x;
				p2.y = enemy.y;
				if (Point.distance(p1,p2) < (enemy.height*0.5) + (play.plane.height*0.5))
				{
					// Show Plane Explosion
					planeExplode(plane);
					// Subtract a life when the Plane is hit;
					play.lives.subtractLives(1);
					// Check if any lives are left;
					checkLives();
					// reset the enemy hit
					play.enemyManager.resetEnemy(enemy);

				}
			}
		}


		private function bulletAndEnemy():void
		{
			var bullets:Array = play.bulletManager.bullets;
			var enemies:Array = play.enemyManager.enemies;
			var bullet:Bullet;
			var enemy:Enemy;
			var bulletlen:int = bullets.length;
			var enemylen:int = enemies.length;

			for (var bulletNum:int = bulletlen-1; bulletNum>=0; bulletNum--)
			{
				bullet = bullets[bulletNum];
				for (var enemyNum:int = enemylen-1; enemyNum>=0; enemyNum--)
				{
					enemy = enemies[enemyNum];
					p1.x = bullet.x;
					p1.y = bullet.y;
					p2.x = enemy.x;
					p2.y = enemy.y;

					if (Point.distance(p1,p2) < (enemy.height*0.5) + (bullet.height*0.5))
					{
						// show enemy explosion
						play.explosionManager.spawn(enemy.x,enemy.y);
						// play explosion sound;
						channel = Assets.explosion.play();
						// reset the enemy position
						play.enemyManager.resetEnemy(enemy);
						// remove the bullet;
						play.bulletManager.destroyBullet(bullet);
						// update score;
						play.score.addScore(100);
					}
				}
			}
		}

	}

}