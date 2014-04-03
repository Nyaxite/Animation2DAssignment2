package objects 
{
	
	import starling.display.Sprite;
	import starling.text.TextField;
	import starling.core.Starling;
	
	public class Level extends Sprite
	{
		private var level:TextField;
		private var dy:int = 2;
		
		public function Level(text:String) 
		{
			// The Label
			level = new TextField(640, 100, "Level", "miked", 40, 0xFFFFFF);
			level.hAlign = "center";
			
			// Assign the Level Text
			level.text = text;
		
			// start the Level text off the screen
			y = -height;
			
			addChild(level);
		}
		
		public function update():void
		{
			y += dy;
			
			if (y > Starling.current.nativeStage.stageHeight)
			{
				alpha = 0;
				dy = 0;
			}
		}
	}
	
}
