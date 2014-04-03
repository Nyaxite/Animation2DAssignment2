package states
{
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.core.Starling;

	import objects.Plane;
	import objects.Island;
	import objects.Coin;
	import objects.Meteor;
	import objects.Ocean;
	import objects.Score;
	import objects.Lives;
	import objects.Level;

	import managers.MeteorManager;
	import managers.CollisionManager;
	import managers.ExplosionManager;

	import flash.events.Event;
	import flash.display.Stage;
	import flash.media.Sound;
	import flash.media.SoundTransform;
	import flash.media.SoundChannel;

	public class Play extends Sprite
	{
		public var game:Game;
		private var nativeStage:Stage;
		public var ocean:Ocean;
		public var plane:Plane;
		public var island:Island;
		public var coin:Coin;
		public var meteor:Meteor;
		public var meteorManager:MeteorManager;
		public var collisionManager:CollisionManager;
		public var explosionManager:ExplosionManager;
		public var score:Score;
		public var lives:Lives;
		public var level:Level;
		private var channel:SoundChannel;
		
		private const SCORE_TO_PROCEED:int = 100;

		public function Play(game:Game)
		{
			// establish a reference to the main Game Class
			this.game = game;

			touchable = false;

			// initialize the game by adding objects to the stage
			addEventListener(Event.ADDED_TO_STAGE, init);
		}

		private function init(event:Event):void
		{
			// Establish a reference to the native stage
			nativeStage = Starling.current.nativeStage;

			// display the ocean background
			ocean = new Ocean();
			addChild(ocean);

			// display a random island to the stage
			island = new Island();
			addChild(island);

			//display the island's coin
			coin = new Coin(island);
			addChild(coin);

			// display the level
			level = new Level("Level 1");
			addChild(level);

			// add the player's avatar to the stage
			plane = new Plane();
			addChild(plane);

			// play engine sound with 80 ms delay
			channel = Assets.engine.play(80,2000);

			// add the Meteors;
			meteorManager = new MeteorManager(this);

			// Display the Score
			score = new Score();
			addChild(score);
			score.x = 320;

			// Display Player Lives
			lives = new Lives();
			addChild(lives);
			lives.x = 20;

			// Instantiate our collision manager
			collisionManager = new CollisionManager(this);
			
			// Instantiate the explosion manager
			explosionManager = new ExplosionManager(this);

			// listen for changes in the game every frame;
			addEventListener(Event.ENTER_FRAME, update);
		}

		private function update(event:Event):void
		{
			// update the game objects every frame
			ocean.update();
			level.update();
			island.update();
			coin.update();
			plane.update();

			meteorManager.update();
			collisionManager.update();
			checkScore();

		}

		private function checkScore():void
		{
			// Go to level 2 if player has enough points
			if (parseInt(score.value.text) == SCORE_TO_PROCEED)
			{
				game.changeState(Game.LEVEL2_STATE);
			}

		}

		public function destroy():void
		{
			removeChild(ocean);
			removeChild(level);
			removeChild(island);
			removeChild(plane);
			removeChild(score);
			removeChild(lives);
			meteorManager.destroy();
			channel.stop();
			removeFromParent(true);
		}

	}

}