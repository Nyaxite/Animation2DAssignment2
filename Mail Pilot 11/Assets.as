/*
	Authors: Tom Tsiliopoulos/Michael Burnie
	Description: Changed many assets from the original Mail Pilot v10, including images, fonts, and sounds/music.
*/
package 
{
	import starling.text.BitmapFont;
	import starling.text.TextField;
	import starling.textures.Texture;
	import starling.textures.TextureAtlas;
	import flash.media.Sound;
	import flash.media.SoundTransform;

	public class Assets
	{
		// Embed the Ocean Sprite
		[Embed(source="assets/images/space.gif")]
		private static var ocean:Class;
		public static var oceanTexture:Texture;
		
		[Embed(source="assets/images/background.png")]
		private static var background:Class;
		public static var backgroundTexture:Texture;
		
		// Embed the MailPilot Texture Atlas
		[Embed(source="assets/images/atlas.png")]
		private static var atlas:Class;
		
		public static var mpAtlas:TextureAtlas;
		
		[Embed(source="assets/images/atlas.xml", mimeType="application/octet-stream")]
		private static var atlasXML:Class;
				
		// Embed Game Sounds
		[Embed(source="assets/sounds/explosion.mp3")]
		public static var explosionSound:Class;
		public static var explosion:Sound;
		
		[Embed(source="assets/sounds/meteor.mp3")]
		public static var thunderSound:Class;
		public static var thunder:Sound;
		
		[Embed(source="assets/sounds/coin.mp3")]
		public static var coinSound:Class;
		public static var coin:Sound;
		
		[Embed(source="assets/sounds/soundtrack.mp3")]
		public static var soundtrackSound:Class;
		public static var soundtrack:Sound;
		
		[Embed(source="assets/sounds/engine.mp3")]
		public static var engineSound:Class;
		public static var engine:Sound;
		
		[Embed(source="assets/sounds/sfx_laser.mp3")]
		public static var bulletSound:Class;
		public static var bullet:Sound;
		
		// Embed Game Fonts
		[Embed(source="assets/fonts/miked.png")]
		private static var miked:Class;
		
		[Embed(source="assets/fonts/miked.fnt", mimeType="application/octet-stream")]
		private static var mikedXML:Class;		
		
		public static function init():void
		{
			// instansiate the image and sound assets
			oceanTexture = Texture.fromBitmap(new ocean());
			
			backgroundTexture = Texture.fromBitmap(new background());
			
			mpAtlas = new TextureAtlas(Texture.fromBitmap(new atlas()),
				XML(new atlasXML()));
			
			explosion = new explosionSound();
			explosion.play(0,0, new SoundTransform(0));
			
			thunder = new thunderSound();
			thunder.play(0,0, new SoundTransform(0));
			
			coin = new coinSound();
			coin.play(0,0, new SoundTransform(0));
			
			soundtrack = new soundtrackSound();
			soundtrack.play(0,0, new SoundTransform(0));
			
			engine = new engineSound();
			engine.play(0,0, new SoundTransform(0));
			
			bullet = new bulletSound();
			bullet.play(0,0, new SoundTransform(0));
			
			TextField.registerBitmapFont(new BitmapFont(Texture.fromBitmap(new miked()),
				XML(new mikedXML())));
			
		}

	}

}