package  {
	
	import org.flixel.*;
	
	public class Player extends FlxSprite{
		
		[Embed(source = "../assets/sfx/shoot.mp3")] private var shoot:Class;
		[Embed(source = "../assets/gfx/working/char_tmp.png")] private var gfx:Class;
		
		private var dir:String;
		public var pos:FlxPoint;
		private var time:Number;
		
		public function Player(X:Number=0, Y:Number=0) {
			super(X, Y);
			loadGraphic(gfx, true, false, 21, 24, false);
			
			time = 0;
			width = 14;
			height = 18;
			centerOffsets();
			
			addAnimation("standNoAloneR", [0], 0, false);
			addAnimation("standNoAloneL", [3], 0, false);
			addAnimation("standNormalR", [6], 0, false);
			addAnimation("standNormalL", [9], 0, false);
			addAnimation("standAloneR", [12], 0, false);
			addAnimation("standAloneL", [15], 0, false);
			
			addAnimation("walkNoAloneR", [1, 0, 1, 2], 4, true);
			addAnimation("walkNoAloneL", [4, 3, 4, 5], 4, true);
			addAnimation("walkNormalR", [7, 6, 7, 8], 4, true);
			addAnimation("walkNormalL", [10, 9, 10, 11], 4, true);
			addAnimation("walkAloneR", [13, 12, 13, 14], 4, true);
			addAnimation("walkAloneL", [16, 15, 16, 17], 4, true);
			
			play("standNoAloneR");
			dir = "R";
			
			health = 50;
			pos = new FlxPoint(x, y);
		}
		
		override public function update():void {
			velocity.x = FlxG.mouse.x - 7 - x;
			velocity.y = FlxG.mouse.y - 9 - y;
			
			if (FlxG.keys.justPressed("SPACE")) {
				moves = !moves;
			}
			
			if (FlxG.mouse.pressed()) {
				if(health > 75){
					if (time <= 0) {
						if (S_GameState._shoots != null) {
							var tmp:FlxBasic;
							FlxG.play(shoot);
							tmp = S_GameState._shoots.recycle(Bullet);
							(tmp as Bullet).start();
							tmp.revive();
							time = 5;
						}
					}
				}
			}
			
			if ( (Math.abs(velocity.x) <= 1) && (Math.abs(velocity.y) <= 1)) {
				velocity.x = 0;
				velocity.y = 0;
				if (health > 75) {
					play("standNoAlone" + dir, false);
				}
				else if (health < 25) {
					play("standAlone" + dir, false);
				}
				else {
					play("standNormal" + dir, false);
				}
			}
			else if (velocity.x > 0) {
				if (health > 75) {
					play("walkNoAloneR", false);
					
				}
				else if (health < 25) {
					play("walkAloneR", false);
				}
				else {
					play("walkNormalR", false);
				}
				dir = "R";
			}
			else {
				if (health > 75) {
					play("walkNoAloneL", false);
				}
				else if (health < 25) {
					play("walkAloneL", false);
				}
				else {
					play("walkNormalL", false);
				}
				dir = "L";
			}
			
			health += S_GameState._friends.countLiving() / 500;
			//health += Friends.friended / 500;
			if (health > 100) {
				health = 100;
			}
			
			if (health < 25) {
				//hurt();
			}
			
			super.update();
			
			time--;
			pos.x = x;
			pos.y = y;
		}
	}

}