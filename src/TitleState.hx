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

        var gf:FlxSprite = new FlxSprite();
        gf.x = FlxG.width * 0.4;
        gf.y = FlxG.height * 0.07;
        gf.frames = Files.getSparrowAtlas("gfDanceTitle", "preload");
        gf.animation.addByPrefix("dance", "gfDance", 24, true);
        gf.animation.play("dance");
        gf.antialiasing = Config.antialiasing;
        add(gf);
    }
}