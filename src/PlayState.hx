package;

import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;
import flixel.FlxCamera;
import flixel.FlxG;
import flixel.FlxState;

class PlayState extends FlxState
{
    public var game:FlxCamera;

    public var song:String = "null";

    public var player1:String = "bf";
    public var player2:String = "dad";
    public var gf:String = "gf";

    public var boyfriend:Character;
    public var girlfriend:Character;
    public var dad:Character;

    public var stage:String = "stage";

    public var background:Stage;

    public function new(lSong:String, ?p1:String = "bf", ?p2:String = "dad", ?p3:String = "gf", ?bg:String = "stage")
    {
        super();

        song = lSong;
        player1 = p1;
        player2 = p2;
        gf = p3;
        stage = bg;

        if (FlxG.sound.music != null)
        {
            FlxG.sound.music.stop();
        }
    }

    override function create()
    {
        super.create();

        game = new FlxCamera();

        FlxG.cameras.add(game);

        background = new Stage(stage);
        add(background);

        girlfriend = new Character(gf);
        girlfriend.screenCenter();
        add(girlfriend);
        girlfriend.y += 360;

        dad = new Character(player2);
        dad.screenCenter();
        add(dad);
        dad.x -= 450;

        boyfriend = new Character(player1);
        boyfriend.screenCenter();
        add(boyfriend);
        boyfriend.x += 450;
        boyfriend.y += 360;

        startSong();
    }

    override function update(elapsed:Float)
    {
        super.update(elapsed);

        if (FlxG.keys.pressed.UP)
        {
            boyfriend.up();
        }

        if (FlxG.keys.pressed.DOWN)
        {
            boyfriend.down();
        }

        if (FlxG.keys.pressed.LEFT)
        {
            boyfriend.left();
        }

        if (FlxG.keys.pressed.RIGHT)
        {
            boyfriend.right();
        }
    }

    public function startSong()
    {
        FlxG.sound.playMusic(Files.inst(song));
        //FlxG.sound.play(Files.voices(song));

        moveCam(boyfriend);
    }

    public function moveCam(target:Character)
    {
        FlxTween.cancelTweensOf(game);
        game.follow(target, FlxCameraFollowStyle.NO_DEAD_ZONE, 1);
        FlxTween.tween(game, {zoom: 0.65}, 1, {
            ease: FlxEase.expoOut,
        });
    }
}