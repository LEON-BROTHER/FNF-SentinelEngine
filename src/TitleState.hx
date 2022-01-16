package;

import flixel.FlxSprite;
import flixel.FlxG;
import flixel.FlxState;

class TitleState extends FlxState
{
    public function new()
    {
        super();
    }

    override function create()
    {
        super.create();

        if (FlxG.sound.music == null)
        {
            FlxG.sound.playMusic(Files.music("freakyMenu", "preload"), 0, true);
            FlxG.sound.music.fadeIn(4, 0, 1);
        }

        var gf:FlxSprite = new FlxSprite(FlxG.width * 0.4, FlxG.height * 0.07);
        gf.frames = Files.getSparrowAtlas("gfDanceTitle", "preload");
        gf.animation.addByPrefix("dance", "gfDance", 24, true);
        gf.animation.play("dance");
        gf.antialiasing = Config.antialiasing;
        add(gf);

        var titleCard:FlxSprite = new FlxSprite(-100, -100);
        titleCard.frames = Files.getSparrowAtlas("logoBumpin", "preload");
        titleCard.animation.addByPrefix("logo", "logo bumpin", 24, true);
        titleCard.animation.play("logo");
        titleCard.antialiasing = Config.antialiasing;
        add(titleCard);
    }
}