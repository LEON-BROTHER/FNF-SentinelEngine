package;

#if MODS_ALLOWED
import sys.FileSystem;
#end

import editors.CreateNewModEditorState;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.tweens.FlxEase;
import flixel.FlxSprite;
import flixel.tweens.FlxTween;
import flixel.FlxG;

class ModsMenuState extends FunkinState
{
    private var mods:Array<String>;
    private var item:Int;
    private var bg:FlxSprite;

    private var text:FlxTypedGroup<Alphabet>;

    public function new()
    {
        super();

        #if MODS_ALLOWED
        mods = Files.getModsList();
        #else
        mods = [""];
        #end

        #if desktop
        Discord.UpdateStatus("In The Menu", "In The Mods Menu");
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

        for (mod in 0...mods.length)
        {
            var name:String = mods[mod];
            for (letter in 0...name.length)
            {
                var alpha:Alphabet = new Alphabet(name.charAt(letter), true);
                alpha.itemID = mod;
                alpha.itemLetterOffset = letter;
                text.add(alpha);
            }
        }

        for (letter in 0..."Create New Mod".length)
        {
            var alpha:Alphabet = new Alphabet("Create New Mod".charAt(letter), true);
            alpha.itemID = mods.length;
            alpha.itemLetterOffset = letter;
            text.add(alpha);
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
            select(item);
        }

        if (FlxG.keys.justPressed.ESCAPE)
        {
            FlxG.sound.play(Files.sound("cancelMenu", "preload"));
            FunkinState.switchState(new MainMenuState());
        }
    }

    public function selectItem(numb:Int)
    {
        item = numb;
    
        if (item < 0)
        {
            item = mods.length;
        }

        if (item > mods.length)
        {
            item = 0;
        }

        FlxTween.cancelTweensOf(bg, ["y"]);

        for (num in 0...text.length)
        {
            FlxTween.cancelTweensOf(text.members[num]);
        }

        FlxTween.tween(bg, {y: (item - (item * 2)) * (35 / (mods.length - 1))}, 1.5, {
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

    public function select(num:Int)
    {
        FlxG.sound.play(Files.sound("confirmMenu", "preload"));

        if (item == mods.length)
        {
            FunkinState.switchState(new CreateNewModEditorState());
        }
    }
}