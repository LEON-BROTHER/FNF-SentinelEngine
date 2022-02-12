package;

import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.FlxSprite;
import flixel.FlxG;

using StringTools;

class CreditsState extends FunkinState
{
    private var creators:Array<String>;
    private var item:Int;
    private var bg:FlxSprite;

    private var text:FlxTypedGroup<Alphabet>;
    private var iconz:FlxTypedGroup<FlxSprite>;

    public function new()
    {
        super();
    }

    override function create()
    {
        super.create();

        bg = new FlxSprite().loadGraphic(Files.image("menuBG", "preload"));
        bg.antialiasing = Config.antialiasing;
        bg.setGraphicSize(Math.round(bg.width * 1.1), Math.round(bg.height * 1.1));
        bg.screenCenter();
        add(bg);
        bg.x = 0;

        text = new FlxTypedGroup<Alphabet>();
        add(text);

        iconz = new FlxTypedGroup<FlxSprite>();
        add(iconz);

        for (char in 0...creators.length)
        {
            var name:String = creators[char].split(":")[0];
            for (letter in 0...name.length)
            {
                var alpha:Alphabet = new Alphabet(name.charAt(letter), true); //TODO: Allow Non-Bold Letter Framework - Generalisk
                alpha.itemID = char;
                alpha.itemLetterOffset = letter;
                text.add(alpha);
            }

            var icon:FlxSprite = new FlxSprite().loadGraphic(Files.image("credits/" + creators[char].split(":")[0].toLowerCase().replace(" ", "_"), "preload"));
            iconz.add(icon);
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
            var temp:Int = item;
            item = numb;
        
            if (item < 0)
            {
                item = creators.length - 1;
            }
    
            if (item > creators.length - 1)
            {
                item = 0;
            }
    
            FlxTween.cancelTweensOf(bg, ["y"]);
    
            for (num in 0...text.length)
            {
                FlxTween.cancelTweensOf(text.members[num]);
            }
    
            for (num in 0...iconz.length)
            {
                FlxTween.cancelTweensOf(iconz.members[num]);
            }
    
            FlxTween.tween(bg, {y: ((item - 2) - ((item - 2) * 2)) * (35 / (creators.length - 1))}, 1.5, {
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
    
            for (num in 0...iconz.length)
            {
                FlxTween.tween(iconz.members[num], {y: 450 + ((num - item) * 160) - 50}, 1.5, {
                    ease: FlxEase.expoOut,
                });
                FlxTween.tween(iconz.members[num], {x: (creators[num].split(":")[0].length * 50) + (12 * (num - item)) + 100}, 1.5, {
                    ease: FlxEase.expoOut,
                });
            }
        }
    
        public function select(num:Int)
        {
            FlxG.sound.play(Files.sound("confirmMenu", "preload"));
    
            FlxG.openURL(creators[num].split(":")[1]);
        }
}