package {
	
	import org.flixel.*;
	
	[SWF(width = "500", height = "500", backgroundColor = "#000000")]
	
	[Frame(factoryClass="Preloader")]
	public class Main extends FlxGame {
		
		[Embed(source = "../assets/sfx/enemyDied.mp3")]private var sfx1:Class;
		[Embed(source = "../assets/sfx/friend.mp3")]private var sfx2:Class;
		[Embed(source = "../assets/sfx/hit.mp3")]private var sfx3:Class;
		[Embed(source = "../assets/sfx/bt.mp3")] private var sfx4:Class;
		[Embed(source = "../assets/sfx/shoot.mp3")]private var sfx5:Class;
		
		public static var save:FlxSave;
		public static var score:Number;

		public function Main():void {
			//super(250, 250, S_TestState, 2, 60, 30, true);
			//super(250, 250, S_GameState, 2, 60, 30, true);
			FlxG.debug = true;
			super(250, 250, S_MenuState, 2, 60, 30, true);
			FlxG.loadSound(sfx1);
			FlxG.loadSound(sfx2);
			FlxG.loadSound(sfx3);
			FlxG.loadSound(sfx4);
			FlxG.loadSound(sfx5);
			save = new FlxSave();
			save.bind("loneliness_Save");
			score = save.data.score;
			if (isNaN(score)) {
				score = 0;
				save.data.score = 0;
			}
		}
		
	}

}