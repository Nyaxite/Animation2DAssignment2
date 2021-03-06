﻿package objects 
{
	
	import starling.display.Sprite;
	import starling.text.TextField;
	
	public class Score extends Sprite
	{
		public var value:TextField;
		private var scoreLabel:TextField;
		
		public function Score() 
		{
			// The Label
			scoreLabel = new TextField(300, 100, "Score", "miked", 32, 0xFFFFFF);
			scoreLabel.hAlign = "right";
			addChild(scoreLabel);
			
			// The Score
			value = new TextField(300, 100, "0", "miked", 32, 0xFFFFFF);
			value.hAlign = "right";
			value.y = 30;
			
			addChild(value);
		}
		
		public function addScore(amount:Number):void
		{
			value.text = (parseInt(value.text) + amount).toString();
		}

	}
	
}
