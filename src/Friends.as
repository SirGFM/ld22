package  {
	
	import org.flixel.*;
	
	public class Friends extends FlxSprite {
		
		[Embed(source = "../assets/sfx/friend.mp3")] private var sfx:Class;
		
		protected var follow:Boolean;
		private var hit:Boolean;
		public static var friended:Number;
		
		public function Friends() {
			super();
			follow = false;
			hit = false;
			health = 0;
		}
		
		override public function update():void {
			var dX:Number;
			var dY:Number;
			var X:Number = S_GameState._player.x;
			var Y:Number = S_GameState._player.y;
			var dist:Number = Math.sqrt((x - X - 7) * (x - X - 7) + (y - Y - 9) * (y - Y - 9));
			
			if ((health == 0) || (dist <= 20)) {
				if((follow == true) || (dist <= 20)){
					//follow the player!!!
					if (dist > 20) {
						dY = (y - Y) / (x - X);
						dX = 100 / Math.sqrt( dY * dY + 1);
						dY *= dX;
						if ((x - X) < 0) {
							acceleration.x = dX;
							acceleration.y = dY;
						}
						else {
							acceleration.x = -dX;
							acceleration.y = -dY;
						}
					}
					else {
						acceleration.x = 0;
						acceleration.y = 0;
						velocity.x = 0;
						velocity.y = 0;
					}
					
					follow = true;
					if (path != null) {
						FlxG.play(sfx);
						friended++;
						stopFollowingPath(true);
					}
				}
				else {
					//random path
					if ((x < -6) || (x > 250) || (y < -6) || (y > 250)) {
						kill();
					}
				}
			}
			else {
				//captain! I'M HIT! I'M HIT!
				var myPath:FlxPath = new FlxPath();
				myPath.add((Math.random() * 100) % 250, (Math.random() * 100) % 250);
				followPath(myPath, 30);
				health = 0;
				follow = false;
				hit = true;
				friended--;
				if ((x < -width) || (x > 250) || (y < -height) || (y > 250)) {
					kill();
				}
			}
			
			super.update();
		}
		
		public function start():void {
			var i:int = 10;
			var myPath:FlxPath = new FlxPath();
			
			x = (Math.random() * 100) % 250;
			y = (Math.random() * 100) % 250;
			
			while (i > 0) {
				myPath.add((Math.random() * 100) % 250, (Math.random() * 100) % 250);
				i--;
			}
			followPath(myPath, 25);
		}
		
		override public function hurt(n:Number):void {
			health = -1;
		}
		
		public function Color():void {
			
		}
		
		public function RunAway():void {
			health = -1;
		}
	}

}