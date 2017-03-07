package  {
	
	import org.flixel.*;
	
	public class S_IntroductionState extends FlxState {
		
		private var pl:Player;
		private var txt:FlxText;
		private var time:Number;
		private var i:Number;
		
		public function S_IntroductionState() {
			super();
			time = 0;
			i = 1;
			Friends.friended = 0;
			pl = new Player(FlxG.mouse.x, FlxG.mouse.y);
			txt = new FlxText(0, 0, 250, "You are alone!");
			S_GameState._friends = new FlxGroup();
			S_GameState._player = pl;
			add(pl);
			add(txt);
			add(S_GameState._friends);
			add(new Bar(pl));
			pl.health = 25;
		}
		
		override public function update():void {
			super.update();
			
			FlxG.collide(this, this, callback);
			
			time++;
			time %= 360;
			if (time == 0) {
				txt.alpha -= 0.1;
				time = -1;
			}
			if (txt.alpha == 0) {
				remove(txt);
				newMessage();
				add(txt);
			}
		}
		
		public function callback(obj1:FlxObject, obj2:FlxObject):void {
			if((obj1 is Enemy)||(obj2 is Enemy)){
				obj1.hurt(1);
				obj2.hurt(1);
			}
		}
		
		private function newMessage():void {
			var tmp:FlxSprite;
			switch(i) {
				case 1: {
					txt = new FlxText(0, 0, 250, "So alone your \"loneliness\" is eating you");
				}break;
				case 2: {
					txt = new FlxText(0, 0, 250, "But fraid not!");
				}break;
				case 3: {
					txt = new FlxText(0, 0, 250, "You're not the only one.");
				}break;
				case 4: {
					txt = new FlxText(0, 0, 250, "Try to befriend those.");
					tmp = new FriendBlue();
					(tmp as Friends).start();
					S_GameState._friends.add(tmp);
				}break;
				case 5: {
					txt = new FlxText(0, 0, 250, "Not enough, I see...");
				}break;
				case 6: {
					txt = new FlxText(0, 0, 250, "Try to approach some more.");
					tmp = new FriendRed();
					(tmp as Friends).start();
					S_GameState._friends.add(tmp);
					tmp = new FriendGreen();
					(tmp as Friends).start();
					S_GameState._friends.add(tmp);
					tmp = new FriendBlue();
					(tmp as Friends).start();
					S_GameState._friends.add(tmp);
					tmp = new FriendRed();
					(tmp as Friends).start();
					S_GameState._friends.add(tmp);
					tmp = new FriendGreen();
					(tmp as Friends).start();
					S_GameState._friends.add(tmp);
				}break;
				case 7: {
					txt = new FlxText(0, 0, 250, "See? You're barely alone now.");
				}break;
				case 8: {
					txt = new FlxText(0, 0, 250, "Some some aren't happy with your lack of loneliness...");
				}break;
				case 9: {
					txt = new FlxText(0, 0, 250, "Beware!");
				}break;
				case 10: {
					txt = new FlxText(0, 0, 250, "They can make some flee and break you all apart.");
					Enemy.follow = false;
					Enemy.dificulty = 1;
					tmp = new Enemy();
					tmp.health = 10;
					(tmp as Enemy).start();
					add(tmp);
				}break;
				case 11: {
					txt = new FlxText(0, 0, 250, "Just keep yourself...");
				}break;
				case 12: {
					txt = new FlxText(0, 0, 250, "... not...");
				}break;
				case 13: {
					txt = new FlxText(0, 0, 250, "ALONE!");
				}break;
				case 14: {
					S_GameState._friends = null;
					S_GameState._player = null;
					FlxG.switchState(new S_MenuState());
				}break;
			}
			time = 0;
			i++;
		}
		
	}

}