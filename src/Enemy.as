package  {
	
	import org.flixel.*;
	
	//IT'S NOT ANIMATING
	//TIME IS RUNNING OUT!!!!!
	//(well.... write about it won't help... ¬¬)
	
	public class Enemy extends FlxSprite {
		
		[Embed(source = "../assets/sfx/enemyDied.mp3")] private var killed:Class;
		[Embed(source = "../assets/gfx/working/char_tmp.png")] private var gfx:Class;
		
		public static var follow:Boolean;
		public static var dificulty:Number;
		
		public function Enemy() {
			super();
			loadGraphic(gfx, true, false, 21, 24, false);
			
			width = 14;
			height = 18;
			centerOffsets();
			
			addAnimation("standBadR", [18], 0, false);
			addAnimation("standBadL", [21], 0, false);
			
			addAnimation("walkBadR", [19, 18, 19, 20], 4, true);
			addAnimation("walkBadL", [22, 21, 22, 23], 4, true);
		}
		
		public function start():void {
			var i:int = 5 * dificulty;
			var myPath:FlxPath = new FlxPath();
			x = (Math.random() * 100) % 250;
			y = (Math.random() * 100) % 250;
			health = 10 * dificulty;
			play("walkBadR", false);
			if(!follow){
				while (i > 0) {
					myPath.add((Math.random() * 100) % 250, (Math.random() * 100) % 250);
					i--;
				}
			}
			else {
				myPath.addPoint(S_GameState._player.pos, true);
			}
			followPath(myPath, 50);
		}
		
		override public function update():void {
			//var X:Number = 0;
			//X = x.valueOf();
			super.update();/*
			if (x > X) {
				play("walkBadR");
			}
			else {
				play("walkBadL");
			}*/
			if ((x < -14) || (x > 250) || (y < -18) || (y > 250)) {
				kill();
			}
		}
		
		override public function kill():void {
			if (health <= 0) {
				S_GameState._score += 100;
				FlxG.play(killed);
			}
			super.kill();
		}
		
	}

}