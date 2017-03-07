package  {
	
	import org.flixel.*;
	
	public class Bullet extends FlxSprite{
		
		[Embed(source="../assets/gfx/bullet.png")] private var gfx:Class;
		
		public function Bullet() {
			super(0, 0, gfx);
			width = 3;
			height = 3;
			centerOffsets();
		}
		
		public function start():void {
			var myPath:FlxPath;
			x = S_GameState._player.x;
			y = S_GameState._player.y;
			myPath = new FlxPath();
			myPath.add(FlxG.mouse.x, FlxG.mouse.y);
			followPath(myPath);
		}
		
	}

}