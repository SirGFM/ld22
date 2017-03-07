package  {
	
	import org.flixel.*;
	
	public class S_MenuState extends FlxState {
		
		[Embed(source = "../assets/gfx/char_alone.png")] private var aaa:Class;
		[Embed(source = "../assets/sfx/bt.mp3")] private var bt:Class;
		[Embed(source = "../assets/sfx/ld22_menu.mp3")] private var sfx:Class;
		[Embed(source = "../assets/gfx/blue.png")] private var blue:Class;
		[Embed(source = "../assets/gfx/green.png")] private var green:Class;
		[Embed(source = "../assets/gfx/red.png")] private var red:Class;
		[Embed(source = "../assets/gfx/mouse.png")] private var mouse:Class;
		[Embed(source = "../assets/gfx/tile.png")] private var tile:Class;
		
		public function S_MenuState() {
			super();
			add(new FlxText(50, 0, 200, "High score: " + Main.score));
			add(new FlxSprite(0, 30, tile));
			add(new FlxButton(29, 149, "START", play));
			add(new FlxButton(29, 174, "INTRODUCTION", intro));
			add(new FlxSprite(124, 149, mouse));
			add(new FlxText(139, 142, 111, "Mouse to move/Click to shoot*"));
			add(new FlxSprite(119, 169, blue));
			add(new FlxSprite(125, 169, green));
			add(new FlxSprite(122, 163, red));
			add(new FlxText(139, 165, 111, "Catch those"));
			add(new FlxSprite(114, 182, aaa));
			add(new FlxText(139, 185, 111, "Evade those"));
			
			add(new FlxText(0, 235, 250, "*You can only shoot when like this:"));
		}
		
		override public function create():void {
			super.create();
			FlxG.loadSound(sfx, 1.0, true, false, true, null);
		}
		
		public function play():void {
			FlxG.switchState(new S_GameState());
			FlxG.play(bt);
		}
		
		public function intro():void {
			FlxG.switchState(new S_IntroductionState());
			FlxG.play(bt);
		}
		
	}

}