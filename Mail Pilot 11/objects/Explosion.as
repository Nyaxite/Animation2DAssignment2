﻿package objects{	import starling.display.MovieClip;	import starling.display.Sprite;	import starling.core.Starling;	import starling.textures.Texture;		public class Explosion extends MovieClip	{		public function Explosion()		{			// Load our Plane image from our Texture Atlas			super(Assets.mpAtlas.getTextures("bigexplosion"),20);						// set our explosion's registration point to the center			pivotX = width * 0.5;			pivotY = height * 0.5;		}			}}