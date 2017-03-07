package  {
	
	import org.flixel.*;
	
	public class Foo extends FlxSprite {
		
		[Embed(source = "../assets/gfx/working/colorTest.png")] private var GFX:Class;
		
		private var enemy:FlxSprite;
		public var dist:Number;
		
		public function Foo(_enemy:FlxSprite) {
			super(50, 50, GFX);
			health = 100;
			enemy = _enemy;
			dist = 0;
		}
		
		override public function update():void {
			//var dist:Number = Math.sqrt((x - enemy.x) * (x - enemy.x) + (y - enemy.y) * (y - enemy.y));
			dist = Math.sqrt((x - enemy.x) * (x - enemy.x) + (y - enemy.y) * (y - enemy.y));
			if (dist < 50) {
				if(health > 0){
					health -= 0.5;
				}
				else {
					health = 0;
				}
			}
			else {
				if(health < 100){
					health += 0.5;
				}
				else {
					health = 100;
				}
			}
			super.update();
		}
		
	}

}