package;

import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;
import flixel.FlxSprite;
import flixel.FlxG;
import flixel.FlxState;

class OptionsState extends FlxState
{
    private var options:Array<Dynamic> = [
        ["Anti-Aliasing", BoolOptionType, "Enable/Disable Anti-Aliasing, Which Smoothes Out The Texture's To Make Them Look Less Pixelly"],
        ["Low Quality", BoolOptionType, "Decreases The Game's Quality, But Boost's Performance"],
        ["Record Replay's", BoolOptionType, "Enable/Disable Whether You Want The Game To Record Replay's"],
        ["Cache Replay File's", BoolOptionType, "Enable/Disable Whether You Want Your Replay To Have The Nessecary File's Stored Inside It (Song, Chart, Character's). Useful If You Want To Send Your Friend A Replay For A Mod Song"],
        ["Down Scroll", BoolOptionType, "Arrow's Scroll From Top To Bottom Of The Screen Instead Of Bottom To Top. HUD Get's Inverted Vertically"]
    ];

    private var item:Int;
    private var bg:FlxSprite;

    private var text:FlxTypedGroup<Alphabet>;

    public function new()
    {
        super();
        Config.loadConfig();
    }

    override function create()
    {
        super.create();

        bg = new FlxSprite().loadGraphic(Files.image("menuBGBlue", "preload"));
        bg.antialiasing = Config.antialiasing;
        bg.setGraphicSize(Math.round(bg.width * 1.1), Math.round(bg.height * 1.1));
        bg.screenCenter();
        add(bg);
        bg.x = 0;

        text = new FlxTypedGroup<Alphabet>();
        add(text);

        for (option in 0...options.length)
        {
            var name:String = options[option][0];
            for (letter in 0...name.length)
            {
                var alpha:Alphabet = new Alphabet(name.charAt(letter), true);
                alpha.itemID = option;
                alpha.itemLetterOffset = letter;
                text.add(alpha);
            }
        }

        selectItem(0);
    }

    override function update(elapsed:Float)
    {
        super.update(elapsed);

        if (FlxG.keys.justPressed.DOWN)
        {
            FlxG.sound.play(Files.sound("scrollMenu", "preload"));
            selectItem(item + 1);
        }
        else if (FlxG.keys.justPressed.UP)
        {
            FlxG.sound.play(Files.sound("scrollMenu", "preload"));
            selectItem(item - 1);
        }

        if (FlxG.keys.justPressed.ESCAPE)
        {
            FlxG.sound.play(Files.sound("cancelMenu", "preload"));
            FlxG.switchState(new MainMenuState());
        }
    }

    public function selectItem(num:Int)
    {
        item = num;

        if (item < 0)
        {
            item = options.length - 1;
        }

        if (item > options.length - 1)
        {
            item = 0;
        }

        FlxTween.cancelTweensOf(bg);

        for (num in 0...text.length)
        {
            FlxTween.cancelTweensOf(text.members[num]);
        }

        FlxTween.tween(bg, {y: (item - (item * 2)) * (35 / (options.length - 1))}, 1.5, {
            ease: FlxEase.expoOut,
        });

        for (num in 0...text.length)
        {
            FlxTween.tween(text.members[num], {y: 450 + ((text.members[num].itemID - item) * 160)}, 1.5, {
                ease: FlxEase.expoOut,
            });
            FlxTween.tween(text.members[num], {x: 110 + (12 * (text.members[num].itemID - item)) + (50 * text.members[num].itemLetterOffset)}, 1.5, {
                ease: FlxEase.expoOut,
            });
        }
    }
}

class OptionType
{
    public var title:String;
    public var description:String;

    public function new(titl:String, desc:String)
    {
        title = titl;
        description = desc;
    }
}

class BoolOptionType extends OptionType
{
    public function new(titl:String, desc:String)
    {
        super(titl, desc);
    }
}