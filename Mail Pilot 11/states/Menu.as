package states
{
	import starling.display.Sprite;
	import starling.display.Button;
	import starling.events.Event;
	import starling.core.Starling;
	import starling.text.TextField;

	import objects.Plane;
	import objects.Ocean;
	import objects.Score;

	import flash.events.Event;
	import flash.display.Stage;
	import flash.media.SoundChannel;
	
	public class Menu extends Sprite
	{
		public var game:Game;
		private var nativeStage:Stage;
		public var ocean:Ocean;
		public var plane:Plane;
		public var score:Score;
		private var play:Button;
		private var instructions:Button;
		private var channel:SoundChannel;
		private var logoText:TextField;
		private var instructionsText:TextField;
		private var instructionsString:String;

		public function Menu(game:Game)
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

			// add the player's avatar to the stage
			plane = new Plane();
			addChild(plane);

			// play engine game soundtrack with 80 ms delay
			channel = Assets.soundtrack.play(80, 2000);
			
			logoText = new TextField(640,200,"MAIL PILOT","miked",72,0xFFFFFF);
			logoText.hAlign = "center";
			addChild(logoText);
			
	
			instructions = new Button(Assets.mpAtlas.getTexture("instructionsButton"));
			instructions.addEventListener(Event.TRIGGERED, onInstructions);
			instructions.pivotX = instructions.width * 0.5;
			instructions.x = 320;
			instructions.y = 230;
			addChild(instructions);
			
			play = new Button(Assets.mpAtlas.getTexture("playButton"));
			play.addEventListener(Event.TRIGGERED, onPlay);
			play.pivotX = play.width * 0.5;
			play.x = 320;
			play.y = 330;
			addChild(play);

			// listen for changes in the game every frame
			addEventListener(Event.ENTER_FRAME, update);
		}

		private function onInstructions(event:Event):void
		{
			game.changeState(Game.INSTRUCTIONS_STATE);
		}
		
		private function onPlay(event:Event):void
		{
			game.changeState(Game.PLAY_STATE);
		}
		
		private function update(event:Event):void
		{
			// update the game objects every frame
			ocean.update();
			plane.update();
		}

		public function destroy():void
		{
			// Release resources back to memory
			removeChild(ocean);
			removeChild(plane);
			channel.stop();
			removeFromParent(true);
		}

	}

}