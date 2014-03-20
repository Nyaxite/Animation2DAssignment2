﻿package managers{	import states.Play;	import objects.Cloud;	import objects.Island;	import objects.Plane;	import objects.Explosion;	import objects.Coin;	import flash.geom.Point;	import flash.media.Sound;	import flash.media.SoundChannel;	import flash.events.Event;	import flash.utils.Timer;	import flash.events.TimerEvent;	import starling.core.Starling;	import starling.events.Event;	public class CollisionManager	{		// declare reference to Game Class		private var play:Play;		// declare 2 points		private var p1:Point = new Point();		private var p2:Point = new Point();		private var channel:SoundChannel = new SoundChannel();		private var flickerOnTimer:Timer;		private var flickerOffTimer:Timer;		private var delayTimer:Timer;		public function CollisionManager(play:Play)		{			// pass a reference to the game class			this.play = play;		}		public function update():void		{			// on update check if either collision occurs			if (play.plane.onStage == true)			{				planeAndCloud();				planeAndCoin();			}		}		private function planeAndCloud():void		{			var cloud:Cloud;			var clouds:Array = play.cloudManager.clouds;			var plane:Plane = play.plane;			// check collisions with the plane and each cloud			for (var count:int = clouds.length-1; count>=0; count--)			{				// set our local cloud object to each cloud from the cloud array				cloud = clouds[count];				p1.x = plane.x;				p1.y = plane.y;				p2.x = cloud.x;				p2.y = cloud.y;				// Check the distance between the cloud and the plane				if (Point.distance(p1,p2) < (cloud.height / 2) + (plane.height / 2) )				{					// display the explosion animation					play.explosionManager.spawn(plane.x,plane.y);										// play the explosion sound					channel = Assets.explosion.play();					channel.addEventListener(Event.SOUND_COMPLETE, explosionComplete);					// remove the ship image					plane.alpha = 0;					plane.onStage = false;					// Subtract a life when the Plane is hit;					play.lives.subtractLives(1);					if (parseInt(play.lives.value.text) < 1)					{						play.game.changeState(Game.GAME_OVER_STATE);					}				}			}		}		private function explosionComplete(event:Event):void		{			flickerOnTimer = new Timer(500,1);			flickerOnTimer.addEventListener(TimerEvent.TIMER_COMPLETE, flickerPlaneOn);			flickerOnTimer.start();		}		private function flickerPlaneOn(event:TimerEvent):void		{			// show the plane with 50% transparency for half a second			play.plane.alpha = .5;			flickerOffTimer = new Timer(500,1);			flickerOffTimer.addEventListener(TimerEvent.TIMER_COMPLETE, flickerPlaneOff);			flickerOffTimer.start();		}				private function flickerPlaneOff(event:TimerEvent):void		{			// hide the plane for half a second			play.plane.alpha = 0;			delayTimer = new Timer(500,1);			delayTimer.addEventListener(TimerEvent.TIMER_COMPLETE, newPlane);			delayTimer.start();		}				private function newPlane(event:TimerEvent):void		{			// show the plane			play.plane.alpha = 1;			play.plane.onStage = true;		}		private function planeAndCoin():void		{			var coin:Coin = play.coin;			var plane:Plane = play.plane;			p1.x = plane.x;			p1.y = plane.y;			p2.x = coin.x;			p2.y = coin.y;			// Check the distance between the island and the plane			if (Point.distance(p1,p2) < (coin.height / 2) + (plane.height / 2))			{				Assets.coin.play();				// add 100 points every time the Plane passes over the Island;				play.score.addScore(100);				// hide the coin				coin.alpha = 0;				coin.onStage = false;			}		}	}}