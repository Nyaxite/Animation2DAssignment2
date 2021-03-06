﻿package objects
{

	import starling.display.MovieClip;
	import starling.display.Sprite;
	import starling.core.Starling;
	
	public class Plane extends Sprite
	{

		private var plane:MovieClip;
		public var onStage:Boolean = true;
		
		public function Plane()
		{
			// Load our Plane image from our Texture Atlas
			plane = new MovieClip(Assets.mpAtlas.getTextures("player"),30);
			//Starling.juggler.add(plane);
			
			plane.height = 65;
			plane.scaleX = plane.scaleY;
			
			// set our Plane's registration point to the center
			plane.pivotX = plane.width * 0.5;
			plane.pivotY = plane.height * 0.5;
			
			// Limit the Plane to a fixed band of movement
			y = 430;
			
			// display our Plane on the stage
			addChild(plane);
		}
		
		public function update():void
		{
			// Change plane position with some easing on update
			x += (Starling.current.nativeStage.mouseX - x) * 0.3;
			
			// ensure the whole plane stays on the screen
			if(x + plane.width * 0.5 > Starling.current.nativeStage.stageWidth)
			{
				x = Starling.current.nativeStage.stageWidth - plane.width * 0.5;
			}
			
			if(x - plane.width * 0.5 < 0)
			{
				x = plane.width * 0.5;
			}

		}
	}

}