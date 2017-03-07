package  {
	
	import org.flixel.*;
	
	public class S_TestState extends FlxState {
		
		private var rgb:FlxGroup;
		private var pl:Player;
		private var bar:Bar;
		private var _enemies:FlxGroup;
		private var _friends:FlxGroup;
		
		public function S_TestState() {
			super();
			
			pl = new Player();
			add(pl);
			
			S_GameState._player = pl;
			S_GameState._friends = new FlxGroup();
			S_GameState._enemies = new FlxGroup();
			
			add(new Bar(pl));
			add(new RGBShader());
			add(S_GameState._friends);
			add(S_GameState._enemies);
			
			FlxG.mouse.hide();
		}
		
		override public function update():void {
			
			if(FlxG.keys.justPressed("Z")){
				S_GameState._friends.add(new FriendRed());
			}			
			if(FlxG.keys.justPressed("X")){
				S_GameState._friends.add(new FriendGreen());
			}
			if(FlxG.keys.justPressed("C")){
				S_GameState._friends.add(new FriendBlue());
			}
			if (FlxG.keys.justPressed("A")) {
				S_GameState._enemies.add(new Enemy());
			}
			super.update();
		}
		
	}

}