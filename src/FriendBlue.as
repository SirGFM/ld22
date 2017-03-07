package  {
	
	public class FriendBlue extends Friends {
		
		[Embed(source = "../assets/gfx/blue.png")] private var gfx:Class;
		
		public function FriendBlue() {
			super();
			loadGraphic(gfx, false, false, 8, 8, false);
			width = 6;
			height = 6;
			centerOffsets();
		}
		
		override public function Color():void {
			if ((follow == true) && (health == 0)) {
				RGBShader.blue++;
			}
		}
	}

}