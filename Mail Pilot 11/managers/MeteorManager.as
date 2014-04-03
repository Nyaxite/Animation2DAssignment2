package managers
{
	import states.Play;
	
	import objects.Meteor;
	
	import starling.core.Starling;
	import starling.display.DisplayObjectContainer;

	public class MeteorManager
	{
		public var meteors:Array;
		private var numMeteors:int = 4;

		public function MeteorManager(currentParent:DisplayObjectContainer)
		{
			var count:int = 0;

			// create a new meteor array
			meteors = new Array();

			// add three meteors to the array
			while (count < numMeteors)
			{
				if (Math.random() < 0.05)
				{
					// add a new meteor to the meteor array
					meteors.push(new Meteor());

					// add a random meteor to the stage
					currentParent.addChild(meteors[count]);
					count++;
				}
			}


		}

		public function update():void
		{
			var len:int = meteors.length;

			// update each meteor
			for (var count:int=len-1; count >= 0; count--)
			{
				meteors[count].update();
			}
		}
		
		public function destroy():void
		{
			meteors = null;
		}

	}

}