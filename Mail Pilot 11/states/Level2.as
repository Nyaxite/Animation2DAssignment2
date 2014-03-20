package states
{
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.core.Starling;

	import objects.Plane;
	import objects.Island;
	import objects.Coin;
	import objects.Cloud;
	import objects.Ocean;
	import objects.Score;
	import objects.Lives;
	import objects.Level;

	import managers.CloudManager;
	import managers.Level2CollisionManager;
	import managers.EnemyManager;
	import managers.BulletManager;
	import managers.ExplosionManager;

	import flash.events.Event;
	import flash.display.Stage;
	import flash.media.Sound;
	import flash.media.SoundTransform;
	import flash.media.SoundChannel;
	import flash.events.MouseEvent;


	public class Level2 extends Sprite
	{
		public var game:Game;
		private var nativeStage:Stage;
		public var ocean:Ocean;
		public var plane:Plane;
		public var island:Island;
		public var coin:Coin;
		public var cloud:Cloud;
		public var cloudManager:CloudManager;
		public var collisionManager:Level2CollisionManager;
		public var bulletManager:BulletManager;
		public var enemyManager:EnemyManager;
		public var explosionManager:ExplosionManager;
		public var score:Score;
		public var previousScore:Score;
		public var lives:Lives;
		public var previousLives:Lives;
		public var level:Level;
		private var channel:SoundChannel;
		public var fire:Boolean = false;
		
		private const SCORE_TO_PROCEED:int = 200;

		public function Level2(game:Game, previousScore:Score, previousLives:Lives)
		{
			// establish a reference to the main Game Class
			this.game = game;
			this.previousScore = previousScore;
			this.previousLives = previousLives;

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
			level = new Level("Level 2");
			addChild(level);

			// add the player's avatar to the stage
			plane = new Plane();
			addChild(plane);

			// add firing capability to the plane
			bulletManager = new BulletManager(this);

			// add the Enemies;
			enemyManager = new EnemyManager(this);

			// play engine sound with 80 ms delay
			channel = Assets.engine.play(80,2000);

			// add the Clouds;
			cloudManager = new CloudManager(this);

			// Display the Score
			score = new Score();
			score.value.text = previousScore.value.text;
			addChild(score);
			score.x = 320;

			// Display Player Lives
			lives = new Lives();
			lives.value.text = previousLives.value.text;
			addChild(lives);
			lives.x = 20;

			// Instantiate level 2 collision manager
			collisionManager = new Level2CollisionManager(this);
			explosionManager = new ExplosionManager(this);

			nativeStage.addEventListener(MouseEvent.MOUSE_DOWN, onDown);
			nativeStage.addEventListener(MouseEvent.MOUSE_UP, onUp);

			// listen for changes in the game every frame;
			addEventListener(Event.ENTER_FRAME, update);
		}

		private function onDown(event:MouseEvent):void
		{
			fire = true;
		}

		private function onUp(event:MouseEvent):void
		{
			fire = false;
			bulletManager.count = 0;
		}

		private function update(event:Event):void
		{
			// update the game objects every frame
			ocean.update();
			level.update();
			island.update();
			coin.update();
			plane.update();

			bulletManager.update();
			cloudManager.update();
			enemyManager.update();
			collisionManager.update();
			checkScore();
		}

		private function checkScore():void
		{
			// Go to level 3 if player has enough points
			if (parseInt(score.value.text) == SCORE_TO_PROCEED)
			{
				game.changeState(Game.LEVEL3_STATE);
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
			cloudManager.destroy();
			enemyManager.destroy();
			bulletManager.destroy();
			channel.stop();
			removeFromParent(true);
		}

	}

}