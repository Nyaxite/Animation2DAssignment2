﻿package {	import starling.text.BitmapFont;	import starling.text.TextField;	import starling.textures.Texture;	import starling.textures.TextureAtlas;	import flash.media.Sound;	import flash.media.SoundTransform;	public class Assets	{		// Embed the Ocean Sprite		[Embed(source="assets/images/ocean.gif")]		private static var ocean:Class;		public static var oceanTexture:Texture;				[Embed(source="assets/images/background.png")]		private static var background:Class;		public static var backgroundTexture:Texture;				// Embed the MailPilot Texture Atlas		[Embed(source="assets/images/atlas.png")]		private static var atlas:Class;				public static var mpAtlas:TextureAtlas;				[Embed(source="assets/images/atlas.xml", mimeType="application/octet-stream")]		private static var atlasXML:Class;						// Embed Game Sounds		[Embed(source="assets/sounds/explosion.mp3")]		public static var explosionSound:Class;		public static var explosion:Sound;				[Embed(source="assets/sounds/thunder.mp3")]		public static var thunderSound:Class;		public static var thunder:Sound;				[Embed(source="assets/sounds/coin.mp3")]		public static var coinSound:Class;		public static var coin:Sound;				[Embed(source="assets/sounds/soundtrack.mp3")]		public static var soundtrackSound:Class;		public static var soundtrack:Sound;				[Embed(source="assets/sounds/engine.mp3")]		public static var engineSound:Class;		public static var engine:Sound;				[Embed(source="assets/sounds/bullet.mp3")]		public static var bulletSound:Class;		public static var bullet:Sound;				// Embed Game Fonts		[Embed(source="assets/fonts/Dock51.png")]		private static var dock51:Class;				[Embed(source="assets/fonts/Dock51.fnt", mimeType="application/octet-stream")]		private static var dock51XML:Class;				[Embed(source="assets/fonts/Dock51Dark.png")]		private static var dock51Dark:Class;				[Embed(source="assets/fonts/Dock51Dark.fnt", mimeType="application/octet-stream")]		private static var dock51DarkXML:Class;								public static function init():void		{			// instansiate 			oceanTexture = Texture.fromBitmap(new ocean());						backgroundTexture = Texture.fromBitmap(new background());						mpAtlas = new TextureAtlas(Texture.fromBitmap(new atlas()),				XML(new atlasXML()));						explosion = new explosionSound();			explosion.play(0,0, new SoundTransform(0));						thunder = new thunderSound();			thunder.play(0,0, new SoundTransform(0));						coin = new coinSound();			coin.play(0,0, new SoundTransform(0));						soundtrack = new soundtrackSound();			soundtrack.play(0,0, new SoundTransform(0));						engine = new engineSound();			engine.play(0,0, new SoundTransform(0));						bullet = new bulletSound();			bullet.play(0,0, new SoundTransform(0));						TextField.registerBitmapFont(new BitmapFont(Texture.fromBitmap(new dock51()),				XML(new dock51XML())));						TextField.registerBitmapFont(new BitmapFont(Texture.fromBitmap(new dock51Dark()),				XML(new dock51DarkXML())));		}	}}