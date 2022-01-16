package;

import flixel.util.FlxColor;
import flixel.FlxSprite;
import flixel.FlxG;
import flixel.FlxState;

class TitleState extends FlxState
{
    private var enterText:FlxSprite;
    private var bg:FlxSprite;

    public var introPlaying:Bool = false;

    public function new(?skipIntro:Bool = true)
    {
        super();

        Config.loadConfig();

        introPlaying = false;

        if (!skipIntro)
        {
            startIntro();
        }
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

        enterText = new FlxSprite(100, FlxG.height * 0.8);
        enterText.frames = Files.getSparrowAtlas("titleEnter", "preload");
        enterText.animation.addByPrefix("idle", "Press Enter to Begin", 24, true);
        enterText.animation.addByPrefix("selected", "ENTER PRESSED", 24, true);
        enterText.animation.play("idle");
        enterText.antialiasing = Config.antialiasing;
        add(enterText);

        bg = new FlxSprite().makeGraphic(3840, 2160, FlxColor.BLACK, true, "title-bg");
        bg.antialiasing = false;
        add(bg);
    }

    override function update(elapsed:Float)
    {
        super.update(elapsed);

        if (FlxG.keys.justPressed.ENTER)
        {
            if (introPlaying)
            {
                endIntro();
            }
            else
            {
                FlxG.camera.flash(FlxColor.WHITE, 1);
                FlxG.sound.play(Files.sound("confirmMenu", "preload"));
            }
        }
    }

    public function startIntro()
    {
        introPlaying = true;
    }

    public function endIntro()
    {
        bg.destroy();
        FlxG.camera.flash(FlxColor.WHITE, 2.5);
        introPlaying = false;
    }
}