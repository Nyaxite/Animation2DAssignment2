﻿package objects 
{
	
	import starling.display.Sprite;
	import starling.text.TextField;
	
	public class Lives extends Sprite
	{
		public var value:TextField;
		private var livesLabel:TextField;
		
		public function Lives() 
		{
			livesLabel = new TextField(80, 100, "Lives", "miked", 32, 0xFFFFFF);
			livesLabel.hAlign = "center";
			addChild(livesLabel);
			
			value = new TextField(80, 100, "3", "miked", 32, 0xFFFFFF);
			value.hAlign = "center";
			value.y = 30;
			addChild(value);
		}
		
		public function subtractLives(amount:Number):void
		{
			value.text = (parseInt(value.text) - amount).toString();	
		}

	}
	
}
