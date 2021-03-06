﻿package objects
{

	import starling.display.Sprite;
	import starling.display.MovieClip;
	import starling.core.Starling;


	public class Coin extends Sprite
	{

		private var dy:int = 3;
		private var coin:MovieClip;
		private var island:Island;
		public var onStage:Boolean = true;

		public function Coin(island:Island)
		{
			//pass a reference to the Island
			this.island = island;
			
			// Load our Coin's image from our Texture Atlas
			coin = new MovieClip(Assets.mpAtlas.getTextures("star_gold"),30);
			//Starling.juggler.add(coin);

			// set our Coin's registration point to the center
			coin.pivotX = coin.width * 0.5;
			coin.pivotY = coin.height * 0.5;

			// display our Coin on the stage
			addChild(coin);
		}

		public function update():void
		{
			// move the Coin with the island
			if (onStage == true)
			{
				x = island.x;
				y = island.y;
			}
			else
			{
				//position coin off stage
				y = -50;
			}
			
			// check if island has been reset
			if (island.y < 0)
			{
				onStage = true;
				alpha = 1;
			}
		}

	}

}