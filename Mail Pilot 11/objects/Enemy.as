package objects
{
	import starling.display.MovieClip;
	import starling.display.Sprite;
	import starling.core.Starling;
	import starling.textures.Texture;

	public class Enemy extends MovieClip
	{
		//variables for holding values for generating enemies
		private var enemyType:int;
		private var enemyShape:int;
		private var enemyString:String;
		public var speed:int;
		private var enemySize:int;

		public function Enemy()
		{
			// Get a random plane type
			enemyType = Math.random() * 4 + 1;
			enemyShape = Math.random() * 5 + 1;
			speed = Math.random() * 4 + 3;

			// Load the enemy plane image from our Texture Atlas
			if (enemyType == 1)
			{
				enemyString = "enemyBlack";
			}
			else if (enemyType == 2)
			{
				enemyString = "enemyBlue";
			}
			else if (enemyType == 3)
			{
				enemyString = "enemyGreen";
			}
			else if (enemyType == 4)
			{
				enemyString = "enemyRed";
			}
			
			enemyString += enemyShape.toString();

			super(Assets.mpAtlas.getTextures(enemyString),30);
			
			//scale the enemy size randomly
			enemySize = 40 + Math.random() * 20 + 1;
			height = enemySize;
			scaleX = scaleY;
			
			// set the enemy's registration point to the center;
			pivotX = width * 0.5;
			pivotY = height * 0.5;
		}

	}

}