﻿package objects{	import starling.display.Sprite;	import starling.display.Image;	import starling.display.BlendMode;	import starling.core.Starling;	public class Ocean extends Sprite	{		private var dy:int = 3;		private var ocean:Image;				public function Ocean()		{			// Load our Ocean's image from our Texture Atlas			ocean = new Image(Assets.oceanTexture);			ocean.blendMode = BlendMode.NONE;				// initial position of our island			reset();						// display our Ocean on the stage			addChild(ocean);		}				public function update():void		{			// move the Ocean down the screen			y += dy;						// check to see if the Ocean Sprite needs to be Reset			if (y == 0 )			{				reset();			}		}				public function reset():void		{			// start part of the Ocean off the stage			y = -960;		}	}}