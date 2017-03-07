package  {
	
	import org.flixel.*;
	
	/*
	 * 
	 * TO-DO:
		 * check if alpha parameters
		 * is good enough/ drops slow enough
	* 
	* 
	*/ 
	
	public class RGBShader extends FlxGroup {
		
		public static var red:Number;
		public static var green:Number;
		public static var blue:Number;
		
		public function RGBShader() {
			add(new FlxSprite(0, 0));
			add(new FlxSprite(0, 0));
			add(new FlxSprite(0, 0));
			members[0].makeGraphic(250, 250, 0xffff0000);
			members[0].blend = "subtract";
			members[0].alpha = 0.7;
			members[1].makeGraphic(250, 250, 0xff00ff00);
			members[1].blend = "subtract";
			members[1].alpha = 0.7;
			members[2].makeGraphic(250, 250, 0xff0000ff);
			members[2].blend = "subtract";
			members[2].alpha = 0.7;
			
			red = 0;
			green = 0;
			blue = 0;
		}
		
		override public function update():void {
			red = 0;
			green = 0;
			blue = 0;
			S_GameState._friends.callAll("Color", true);
			members[0].alpha = 0.7 / (red);
			members[1].alpha = 0.7 / (green);
			members[2].alpha = 0.7 / (blue);

			if(members[0].alpha > 0.7){
				members[0].alpha = 0.7;
			}
			if(members[1].alpha > 0.7){
				members[1].alpha = 0.7;
			}
			if(members[2].alpha > 0.7){
				members[2].alpha = 0.7;
			}
			
			super.update();
		}
		
	}

}