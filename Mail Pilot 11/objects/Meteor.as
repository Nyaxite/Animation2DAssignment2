package objects
{

	import starling.display.Sprite;
	import starling.display.Image;
	import starling.core.Starling;
	
	import flash.media.SoundChannel;

	public class Meteor extends Sprite
	{

		private var dx:Number = 0;
		private var dy:Number = 0;
		private var image:Image;
		private var channel:SoundChannel;
		
		private var meteorColor:int;
		private var meteorSize:int;
		private var meteorShape:int;
		private var meteorString:String;
		
		public function Meteor()
		{
			// Get a random meteor type
			meteorColor = Math.random() * 2 + 1;
			meteorSize = Math.random() * 3 + 1;
			meteorShape = Math.random() * 2 + 1;

			// Load the meteor from our Texture Atlas
			if (meteorColor == 1)
			{
				meteorString = "meteorBrown";
			}
			else
			{
				meteorString = "meteorGrey";
			}
		
			//set the meteor size
			if (meteorSize == 1)
			{
				meteorString += "_big";
			}
			else if (meteorSize == 2)
			{
				meteorString += "_med";
			}
			else
			{
				meteorString += "_small";
			}
			
			meteorString += meteorShape.toString();
			
			// Load our meteor's image from our Texture Atlas
			image = new Image(Assets.mpAtlas.getTexture(meteorString));
			
			// set our meteor's registration point to the center
			image.pivotX = image.width * 0.5;
			image.pivotY = image.height * 0.5;
			
			// initial position of our meteor
			reset();
			
			// display our meteor on the stage
			addChild(image);
			
			// play thunder sound when meteor is first created
			channel = Assets.thunder.play();
		}
		
		public function update():void
		{
			// move the meteor down the screen with random drift
			x += dx;
			y += dy;
			
			// check to see if the meteor has left the screen
			if (y > (Starling.current.nativeStage.stageHeight + image.height))
			{
				reset();
			}
		}
		
		public function reset():void
		{
			// start the meteor off the stage
			y = -image.height;
			
			// start the meteor at a random location across the top
			x = Math.random() * Starling.current.nativeStage.stageWidth;
			
			// set our meteor speed and drift to random values
			dy = (Math.random() * 3) + 4;
			dx = (Math.random() * -2) + (Math.random() * 2);
		}

	}

}