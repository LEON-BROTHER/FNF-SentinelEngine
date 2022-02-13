package;

import flixel.util.FlxColor;
import flixel.math.FlxVector;
import flixel.FlxSprite;
import flixel.FlxG;
import flixel.FlxSubState;

class GameOverSubState extends FlxSubState
{
    public var pos:FlxVector;
    public var bf:FlxSprite;

    public var song:String;
    public var p1:String;
    public var p2:String;
    public var p3:String;
    public var stage:String;

    public function new(song:String, p1:String, p2:String, gf:String, stage:String, bf:FlxSprite)
    {
        super();

        pos = new FlxVector(bf.x, bf.y);
        this.song = song;
        this.p1 = p1;
        this.p2 = p2;
        p3 = gf;
        this.stage = stage;
    }

    override function create()
    {
        super.create();

        if (FlxG.sound.music != null)
        {
            FlxG.sound.music.stop();
        }

        var bg:FlxSprite = new FlxSprite().makeGraphic(3840, 2160, FlxColor.BLACK, true, "yourdeadlmao");
        bg.screenCenter();
        add(bg);

        bf = new Character("bf");
        bf.setPosition(pos);
        add(bf);

        bf.animation.play("death", true);

        FlxG.sound.play(Files.sound("fnf_loss_sfx", "shared"));

        new FlxTimer().start(1.7, function(tmr:FlxTimer) {
            FlxG.sound.playMusic("gameOver", "shared");
            bf.animation.play("deathLoop", true);
        });
    }

    override function update(elapsed:Float)
    {
        super.update(elapsed);

        if (FlxG.keys.justPressed.ESCAPE)
        {
            FunkinState.switchState(new MainMenuState());
        }

        if (FlxG.keys.justPressed.ENTER)
        {
            FlxG.sound.music.stop();
            FlxG.sound.play(Files.music("gameOverEnd", "shared"));
            bf.animation.play("deathConfirm", true);

            new FlxTimer().start(1.7, function(tmr:FlxTimer) {
                FunkinState.switchState(new PlayState(song, p1, p2, gf, stage));
            });
        }
    }
}