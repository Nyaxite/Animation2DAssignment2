/* Author: Michael Burnie / Tom Tsiliopoulos
Mail Pilot version 11
*/
package 
{
	import starling.display.Sprite;
	import starling.events.Event;

	import states.Play;
	import states.Level2;
	import states.Level3;
	import states.Instructions;
	import states.Menu;
	import states.GameOver;

	import objects.Score;
	import objects.Lives;


	public class Game extends Sprite
	{
		public static const MENU_STATE:int = 0;
		public static const INSTRUCTIONS_STATE:int = 1;
		public static const PLAY_STATE:int = 2;
		public static const LEVEL2_STATE:int = 3;
		public static const LEVEL3_STATE:int = 4;
		public static const GAME_OVER_STATE:int = 5;

		private var menuState:Menu;
		private var instructionsState:Instructions;
		public var playState:Play;
		public var level2State:Level2;
		public var level3State:Level3;
		private var gameOverState:GameOver;
		public var score:Score;
		public var lives:Lives;

		private var previousState:String;

		public function Game()
		{
			// Load the image and other media assets for the game
			Assets.init();

			// initialize the game by adding objects to the stage
			addEventListener(Event.ADDED_TO_STAGE, init);
		}

		private function init(event:Event):void
		{

			// Start off with the Game Menu
			changeState(MENU_STATE);
		}

		public function changeState(state:int):void
		{
			// Launch Various "screens"
			switch (state)
			{
				case MENU_STATE :
					// instantiate Menu screen
					menuState = new Menu(this);

					// display menu screen
					addChild(menuState);
					previousState = "menu";
					break;

				case INSTRUCTIONS_STATE :
					// instantiate Instructions screen
					instructionsState = new Instructions(this);

					// display menu screen
					addChild(instructionsState);
					previousState = "instructions";
					menuState.destroy();
					break;

				case PLAY_STATE :
					// instantiate play screen
					playState = new Play(this);

					// display play screen
					addChild(playState);

					// get Score from Play Screen
					score = playState.score;
					lives = playState.lives;

					// determine which screen to clean up
					if (previousState == "menu")
					{
						// clean up menu state
						menuState.destroy();
					}
					else if (previousState == "instructions")
					{
						// clean up menu state
						instructionsState.destroy();
					}
					else if (previousState == "gameover")
					{
						// clean up game over state
						gameOverState.destroy();
					}
					previousState = "play";
					break;

				case LEVEL2_STATE :
					// instantiate play screen
					level2State = new Level2(this, score, lives);

					// display play screen
					addChild(level2State);
					
					// get Score from Play Screen
					score = level2State.score;
					
					// determine which screen to clean up
					playState.destroy();

					previousState = "level2";
					break;
					
				case LEVEL3_STATE :
				
					// instantiate play screen
					level3State = new Level3(this, score, lives);

					// display play screen
					addChild(level3State);
					
					// get Score from Play Screen
					score = level3State.score;
					
					// determine which screen to clean up
					level2State.destroy();

					previousState = "level3";
					break;

				case GAME_OVER_STATE :

					// instantiate game over screen
					gameOverState = new GameOver(this);

					// pass score to Game Over State
					gameOverState.score = score;

					// Display Game Over Screen
					addChild(gameOverState);
					
					// Clean up play state
					if (previousState == "play")
					{
						playState.destroy();
					}
					else if (previousState == "level2")
					{
						level2State.destroy();
					}
					else if (previousState == "level3")
					{
						level3State.destroy();
					}
					
					previousState = "gameover";
					break;
			}

		}

	}

}