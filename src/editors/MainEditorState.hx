package editors;

import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;
import flixel.FlxSprite;
import flixel.FlxG;

class MainEditorState extends FunkinState
{
    private var editors:Array<Dynamic> = [
        ["Chart Editor", ChartingEditorState],
        ["Create New Mod", CreateNewModEditorState]
    ];

    private var item:Int;
    private var bg:FlxSprite;

    private var text:FlxTypedGroup<Alphabet>;

    public function new()
    {
        super();

        Config.loadConfig();

        #if desktop
        Discord.UpdateStatus("In The Menu", "In The Main Editor Menu");
        #end
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

        for (editor in 0...editors.length)
        {
            var name:String = editors[editor][0];
            for (letter in 0...name.length)
            {
                var alpha:Alphabet = new Alphabet(name.charAt(letter), true);
                alpha.itemID = editor;
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

        if (FlxG.keys.justPressed.ENTER)
        {
            FlxG.sound.play(Files.sound("scrollMenu", "preload"));
            select();
        }

        if (FlxG.keys.justPressed.ESCAPE)
        {
            FlxG.sound.play(Files.sound("cancelMenu", "preload"));
            FunkinState.switchState(new MainMenuState());
        }
    }

    public function selectItem(num:Int)
    {
        item = num;

        if (item < 0)
        {
            item = editors.length - 1;
        }

        if (item > editors.length - 1)
        {
            item = 0;
        }

        FlxTween.cancelTweensOf(bg);

        for (num in 0...text.length)
        {
            FlxTween.cancelTweensOf(text.members[num]);
        }

        FlxTween.tween(bg, {y: (item - (item * 2)) * (35 / (editors.length - 1))}, 1.5, {
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

    public function select()
    {
        FunkinState.switchState(editors[item][1]);
    }
}