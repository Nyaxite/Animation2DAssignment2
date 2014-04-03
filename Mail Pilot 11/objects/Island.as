package objects
{

	import starling.display.Sprite;
	import starling.display.Image;
	import starling.core.Starling;

	public class Island extends Sprite
	{

		private var dy:int = 3;
		private var image:Image;
		
		public function Island()
		{		
			// Load our Island's image from our Texture Atlas
			image = new Image(Assets.mpAtlas.getTexture("platform"));
			
			// set our Island's registration point to the center
			image.pivotX = image.width * 0.5;
			image.pivotY = image.height * 0.5;
			
			// initial position of our island
			reset();
			
			// display our Island on the stage
			addChild(image);
		}
		
		public function update():void
		{
			// move the island down the screen
			y += dy;
			
			// check to see if the island has left the screen
			if (y > (Starling.current.nativeStage.stageHeight + image.height))
			{
				reset();
			}
		}
		
		public function reset():void
		{

			//coin.alpha = 1;
			// start the island off the stage
			y = -image.height;
			
			// start the island at a random location across the top
			x = Math.random() * Starling.current.nativeStage.stageWidth;
		}

	}

}