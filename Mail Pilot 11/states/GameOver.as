﻿package states
{
	import starling.display.Sprite;
	import starling.display.Button;
	import starling.events.Event;
	import starling.core.Starling;
	import starling.text.TextField;

	import objects.Ocean;
	import objects.Score;

	import flash.events.Event;
	import flash.display.Stage;
	import flash.media.SoundChannel;

	public class GameOver extends Sprite
	{
		public var game:Game;
		private var nativeStage:Stage;
		private var ocean:Ocean;
		private var overText:TextField;
		private var finalScoreLabel:TextField;
		private var finalScore:TextField;
		private var tryAgain:Button;
		public var score:Score;
		private var channel:SoundChannel;

		public function GameOver(game:Game)
		{
			// establish a reference to the main Game Class
			this.game = game;

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
			
			// play engine game soundtrack with 80 ms delay
			channel = Assets.soundtrack.play(80, 2000);

			// Game Over Text Field
			overText = new TextField(640,200,"GAME OVER","miked",72,0xFFFFFF);
			overText.hAlign = "center";
			overText.y = 40;
			addChild(overText);

			// Display Final Score
			finalScoreLabel = new TextField(640,200,"FINAL SCORE","miked",36,0xFFFFFF);
			finalScoreLabel.hAlign = "center";
			finalScoreLabel.y = 120;
			addChild(finalScoreLabel);

			finalScore = new TextField(640,200,score.value.text,"miked",36,0xFFFFFF);
			finalScore.hAlign = "center";
			finalScore.y = 160;
			addChild(finalScore);

			// Display Try Again Button
			tryAgain = new Button(Assets.mpAtlas.getTexture("tryAgainButton"));
			tryAgain.addEventListener(Event.TRIGGERED, onAgain);
			tryAgain.pivotX = tryAgain.width * 0.5;
			tryAgain.x = 320;
			tryAgain.y = 300;
			addChild(tryAgain);

			// listen for changes in the game every frame
			addEventListener(Event.ENTER_FRAME, update);
		}

		private function onAgain(event:Event):void
		{
			tryAgain.removeEventListener(Event.TRIGGERED, onAgain);
			game.changeState(Game.PLAY_STATE);
		}

		private function update(event:Event):void
		{
			// update the game objects every frame
			ocean.update();
		}

		public function destroy():void
		{
			// release resources back to memory
			removeChild(ocean);
			removeChild(overText);
			removeChild(finalScoreLabel);
			removeChild(tryAgain);
			channel.stop();
			removeFromParent(true);
		}

	}

}