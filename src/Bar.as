package  {
	
	import org.flixel.*;
	
	public class Bar extends FlxSprite{
		
		private var target:FlxObject;
		private var maxHealth:Number;
		private var tHealth:Number;
		public var bar:FlxSprite;
		
		public function Bar(obj:FlxObject) {
			super();
			target = obj;
			maxHealth = obj.health;
			tHealth = target.health;
			bar = new FlxSprite(x, y);
			bar.makeGraphic(100, 2);
		}
		
		override public function draw():void {
			bar.draw();
		}
		
		override public function update():void {
			var dif:Number
			if (tHealth != target.health) {
				tHealth = target.health;
				bar.scale = new FlxPoint(tHealth / maxHealth, 1);
				bar.dirty = true;
			}
			super.update();
		}
		
	}

}