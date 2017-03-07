package  {
	
	public class FriendGreen extends Friends {
		
		[Embed(source = "../assets/gfx/green.png")] private var gfx:Class;
		
		public function FriendGreen() {
			super();
			loadGraphic(gfx, false, false, 8, 8, false);
			width = 6;
			height = 6;
			centerOffsets();
		}
		
		override public function Color():void {
			if ((follow == true) && (health == 0)) {
				RGBShader.green++;
			}
		}
		
	}

}