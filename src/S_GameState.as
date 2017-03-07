package  {
	
	import org.flixel.*;
	
	/*
	 * 
	 * TO-DO:
		 * add BG
		 * 
		 * add sfx!!
		 * 
		 * introduction (another state, perhaps?)
		 * 
		 * implement some kind of score
		 * 
		 * do everythin listed on:
			 * Player.as
			 * RGBShader.as
		 * 
	 * 
	 * 
	 */
	
	public class S_GameState extends FlxState {
		
		[Embed(source = "../assets/sfx/hit.mp3")]private var hit:Class;
		
		public static var _enemies:FlxGroup;
		public static var _friends:FlxGroup;
		public static var _player:Player;
		public static var _shoots:FlxGroup;
		public static var _score:Number;
		
		private var upScore:Number;
		
		private var score:FlxText;
		private var time:Number;
		
		public function S_GameState() {
			super();
			
			time = 0;
			_score = 0;
			upScore = 0;
			
			Friends.friended = 0;
			
			_enemies = new FlxGroup();
			_friends = new FlxGroup();
			_player = new Player();
			_shoots = new FlxGroup();
			
			add(_enemies);
			add(_shoots);
			add(_friends);
			add(_player);
			add(new RGBShader());
			add(new Bar(_player));
			add(new FlxText(0, 239, 100, "SCORE: "));
			score = new FlxText(45, 239, 100, ""+Math.floor(_score));
			add(score);
		}
		
		override public function update():void {
			var tmp:Number;
			var tmpSpr:FlxBasic;
			
			if (upScore != _score) {
				remove(score);
				score = new FlxText(45, 239, 100, ""+Math.floor(_score));
				add(score);
				upScore = _score;
			}
			
			if (!_player.alive) {
				if (_score > Main.score) {
					Main.score = Math.floor(_score);
					Main.save.data.score = Math.floor(_score);
				}
				FlxG.switchState(new S_MenuState());
				//game over
			}
			
			FlxG.collide(_shoots, _enemies, OnShooEne);
			FlxG.overlap(_enemies, _friends, OnEneFrColl);
			FlxG.collide(_enemies, _player, OnEnePlColl);
			time += _player.health / 50;
			time %= 100;
			
			switch(Math.floor(time)) {
				case 0: {
					_score += _player.health / 10;
				}break;
				case 5: {
					tmpSpr = _friends.recycle(FriendRed);
					(tmpSpr as Friends).start();
					time++;
					FlxG.log("red");
				}break;
				case 16: {
					tmpSpr = _friends.recycle(FriendGreen);
					time++; FlxG.log("green");
					(tmpSpr as Friends).start();
				}break;
				case 56:
				case 21: {
					Enemy.follow = false;
					Enemy.dificulty = 1;
					if(_enemies.countLiving() < 5){
						tmpSpr = _enemies.add(_enemies.recycle(Enemy) as Enemy);
						(tmpSpr as Enemy).start();
						FlxG.log("enemy");
					}
					time++;
				}break;
				case 82: {
					tmpSpr = _friends.recycle(FriendBlue);
					(tmpSpr as Friends).start();
					time++;
					FlxG.log("blue");
				}break;
			}
			if (tmpSpr != null) {
				tmpSpr.revive();
			}
			
			super.update();
		}
		
		public function OnShooEne(bullet:FlxObject, enemy:FlxObject):void {
			bullet.kill();
			enemy.hurt(_player.health / 50);
			FlxG.play(hit);
		}
		
		public function OnEneFrColl(enemy:FlxObject, friend:FlxObject):void {
			enemy.hurt( -0.01);
			friend.hurt(1);
		}
		
		public function OnEnePlColl(enemy:FlxObject, player:FlxObject):void {
			enemy.hurt( -2);
			player.hurt(2);
			_friends.callAll("RunAway", true);
		}
	}

}