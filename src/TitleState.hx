package;

import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.util.FlxTimer;
import flixel.util.FlxColor;
import flixel.FlxSprite;
import flixel.FlxG;
import flixel.FlxState;

class TitleState extends FlxState
{
    private var enterText:FlxSprite;
    private var bg:FlxSprite;

    public var introPlaying:Bool = false;

    public var introText:FlxTypedGroup<FlxSprite>;

    private var introStart:Bool = false;

    public function new(?skipIntro:Bool = true)
    {
        super();

        Config.loadConfig();

        introPlaying = false;
        introStart = !skipIntro;
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

        if (introStart)
        {
            bg = new FlxSprite().makeGraphic(3840, 2160, FlxColor.BLACK, true, "title-bg");
            bg.antialiasing = false;
            add(bg);

            startIntro();
        }
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
                enterText.animation.play("selected");
            }
        }
    }

    public function startIntro()
    {
        introPlaying = true;

        introText = new FlxTypedGroup<FlxSprite>();
        add(introText);

        intro(0);
    }

    public function endIntro()
    {
        bg.destroy();
        clearText();
        FlxG.camera.flash(FlxColor.WHITE, 2.5);
        introPlaying = false;
    }

    public function intro(num:Int)
    {
        trace("Intro");
        if (introPlaying)
        {
            switch (num)
            {
            case 0:
                clearText();
            case 1:
                updateText(["Generalisk", "& The FNF Team"], 1);
            case 2:
                updateText(["Present's"]);
            case 3:
                clearText();
            case 4:
                updateText(["In Ascociation With"], 10);
            case 5:
                updateText(["Newgrounds"], 9);
            case 6:
                clearText();
            case 7:
                updateText(["Top Text"], 1);
            case 8:
                updateText(["Bottom Text"]);
            case 9:
                clearText();
            case 10:
                updateText(["Friday"], 2);
            case 11:
                updateText(["Night"], 1);
            case 12:
                updateText(["Funkin'"]);
            case 13:
                clearText();
                endIntro();
            }
            
            new FlxTimer().start(0.625, function(tmr:FlxTimer) {
                intro(num + 1);
            });
        }
    }

    public function updateText(text:Array<String>, ?blankLines:Int = 0)
    {
        for (line in 0...text.length)
        {
            for (letter in 0...text[line].length)
            {
                var alpha:Alphabet = new Alphabet(text[line].charAt(letter), true);
                alpha.calculatePosition(letter, text[line].length, line, text.length + blankLines);
                introText.add(alpha);
            }
        }
    }

    public function clearText()
    {
        introText.clear();
    }
}