package objects
{
	import starling.display.Sprite;
	import starling.display.MovieClip;
	import starling.core.Starling;

	public class Bullet extends Sprite
	{
		private var bullet:MovieClip;

		public function Bullet()
		{
			//create a new bullet as a movie clip so it can cycle through the various laser textures
			bullet = new MovieClip(Assets.mpAtlas.getTextures("laserBlue"),60);
			Starling.juggler.add(bullet);
			
			pivotX = width * 0.5;
			pivotY = height * 0.5;
			addChild(bullet);
		}

	}

}