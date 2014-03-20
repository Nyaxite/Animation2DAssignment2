﻿package objects{	import starling.display.MovieClip;	import starling.display.Sprite;	import starling.core.Starling;	import starling.textures.Texture;	public class Enemy extends MovieClip	{		private var enemyType:int;		private var enemyString:String;		public var speed:int;		public function Enemy()		{			// Get a random plane type			enemyType = Math.random() * 4 + 1;			speed = Math.random() * 4 + 3;			// Load the enemy plane image from our Texture Atlas			if (enemyType == 1)			{				enemyString = "blueenemy";			}			else if (enemyType == 2)			{				enemyString = "greenenemy";			}			else if (enemyType == 3)			{				enemyString = "whiteenemy";			}			else if (enemyType == 4)			{				enemyString = "yellowenemy";			}			super(Assets.mpAtlas.getTextures(enemyString),30);			// set our Plane's registration point to the center;			pivotX = width * 0.5;			pivotY = height * 0.5;		}	}}