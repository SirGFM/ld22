package  {
	
	import org.flixel.*;
	
	public class Foonemy extends FlxSprite {
		
		public function Foonemy() {
			super(FlxG.mouse.x, FlxG.mouse.y, null);
			makeGraphic(5, 5, 0xffaaaaaa);
		}
		
		override public function update():void {
			//x = FlxG.mouse.x;
			//y = FlxG.mouse.y;
			velocity.x = FlxG.mouse.x - x;
			velocity.y = FlxG.mouse.y - y;
			super.update();
		}
		
	}

}