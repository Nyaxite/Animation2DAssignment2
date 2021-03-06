﻿package states
{
	import starling.display.Sprite;
	import starling.display.Button;
	import starling.events.Event;
	import starling.core.Starling;
	import starling.text.TextField;

	import flash.events.Event;
	import flash.display.Stage;
	import flash.media.SoundChannel;
	
	import objects.Background;

	public class Instructions extends Sprite
	{
		public var game:Game;
		private var nativeStage:Stage;
		private var background:Background;
		private var play:Button;
		private var instructions:Array;
		private var tempText:TextField;
		private var channel:SoundChannel;

		public function Instructions(game:Game)
		{
			// establish a reference to the main Game Class
			this.game = game;

			// initialize the game by adding objects to the stage
			addEventListener(Event.ADDED_TO_STAGE, init);
		}

		private function init(event:Event):void
		{
			var yposition:int = 10;

			// Establish a reference to the native stage
			nativeStage = Starling.current.nativeStage;

			instructions = new Array();

			// Blank out the background
			background = new Background();
			addChild(background);
			
			// play engine game soundtrack with 80 ms delay
			channel = Assets.soundtrack.play(80, 2000);

			// Instruction String
			instructions.push("You are a mail pilot");
			instructions.push("delivering mail to the islands.");
			instructions.push("");
			instructions.push("Fly over an island to drop the mail,");
			instructions.push("but be careful not to fly too close");
			instructions.push("to the clouds. your plane will fall");
			instructions.push("apart if it is hit by lightning too");
			instructions.push("many times.");
			instructions.push("");
			instructions.push("Good Luck!");

			for (var line:String in instructions)
			{
				tempText = new TextField(560,34,instructions[line],"miked",28,0xFFFFFF);
				tempText.hAlign = "center";
				tempText.pivotX = tempText.width * 0.5;
				tempText.x = 320;
				tempText.y = yposition;
				tempText.autoScale = true;
				addChild(tempText);
				yposition +=  34;
			}

			play = new Button(Assets.mpAtlas.getTexture("playButton"));
			play.addEventListener(Event.TRIGGERED, onPlay);
			play.pivotX = play.width * 0.5;
			play.x = 320;
			play.y = 360;
			addChild(play);
		}

		private function onPlay(event:Event):void
		{
			game.changeState(Game.PLAY_STATE);
		}

		public function destroy():void
		{
			// Release resources back to memory
			channel.stop();
			removeFromParent(true);
		}

	}

}