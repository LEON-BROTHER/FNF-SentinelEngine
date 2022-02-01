package;

import flixel.util.FlxTimer;
import flixel.util.FlxColor;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.tweens.FlxEase;
import flixel.FlxG;
import flixel.tweens.FlxTween;
import flixel.FlxSprite;
import flixel.FlxState;

class FreeplayState extends FlxState
{
    private var songsList:Array<String>;
    private var item:Int;

    private var bg:FlxSprite;

    private var text:FlxTypedGroup<Alphabet>;
    private var iconz:FlxTypedGroup<HealthIcon>;

    public function new()
    {
        super();

        songsList = Files.readTextFile(Files.txt("songList", "data", "preload"));
    }

    override function create()
    {
        super.create();

        bg = new FlxSprite().loadGraphic(Files.image("menuDesat", "preload"));
        bg.antialiasing = Config.antialiasing;
        bg.setGraphicSize(Math.round(bg.width * 1.1), Math.round(bg.height * 1.1));
        bg.screenCenter();
        add(bg);
        bg.x = 0;

        text = new FlxTypedGroup<Alphabet>();
        add(text);

        iconz = new FlxTypedGroup<HealthIcon>();
        add(iconz);

        for (song in 0...songsList.length)
        {
            var name:String = songsList[song].split(":")[0];
            for (letter in 0...name.length)
            {
                var alpha:Alphabet = new Alphabet(name.charAt(letter), true);
                alpha.itemID = song;
                alpha.itemLetterOffset = letter;
                text.add(alpha);
            }

            if (songsList[song].split(":").length > 1)
            {
                var icon:HealthIcon = new HealthIcon(songsList[song].split(":")[1]);
                iconz.add(icon);
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
            select(item);
        }

        if (FlxG.keys.justPressed.ESCAPE)
        {
            FlxG.sound.play(Files.sound("cancelMenu", "preload"));
            FlxG.switchState(new MainMenuState());
        }
    }

    public function selectItem(numb:Int)
    {
        var temp:Int = item;
        item = numb;
    
        if (item < 0)
        {
            item = songsList.length - 1;
        }

        if (item > songsList.length - 1)
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

        FlxTween.tween(bg, {y: ((item - 2) - ((item - 2) * 2)) * (35 / (songsList.length - 1))}, 1.5, {
            ease: FlxEase.expoOut,
        });

        if (songsList[item].split(":").length > 2 && songsList[temp].split(":").length > 2)
        {
            if (songsList[item].split(":")[2] != songsList[temp].split(":")[2])
            {
                FlxTween.cancelTweensOf(bg, ["color"]);
                var clr:FlxColor = 0xFFFFFFFF;
                switch (songsList[item].split(":")[2])
                {
                    case "0":
                        clr = 0xFFFF0062;
                    case "1":
                        clr = 0xFFAE00FF;
                    case "2":
                        clr = 0xFFFFAA00;
                    case "3":
                        clr = 0xFF00FF00;
                    case "4":
                        clr = 0xFFFF00AA;
                    case "5":
                        clr = 0xFFFFFFFF;
                    case "6":
                        clr = 0xFFFF00FF;
                    default:
                        clr = 0xFFFFFFFF;
                }

                FlxTween.tween(bg, {color: clr}, 1.5, {});
            }
        }

        FlxG.sound.playMusic(Files.inst(songsList[item].split(":")[0])); //TODO: Fix This Fucking Bullshit Not Loading //Update: Temporarily Fixed For Now, But Not Good. Need's Proper Fix...

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
            FlxTween.tween(iconz.members[num], {x: (songsList[num].split(":")[0].length * 50) + (12 * (num - item)) + 100}, 1.5, {
                ease: FlxEase.expoOut,
            });
        }
    }

    public function select(num:Int)
    {
        FlxG.sound.play(Files.sound("confirmMenu", "preload"));

        new FlxTimer().start(1.5, function(tmr:FlxTimer) {
            //TODO: Softcode This
            var bf:String = "bf";
            var gf:String = "gf";
            var stage:String = "stage";

            switch (songsList[num].split(":")[2])
            {
                case "4":
                    bf = "bf-car";
                    gf = "gf-car";
                case "5":
                    bf = "bf-christmas";
                    gf = "gf-christmas";
                case "6":
                    bf = "bf-pixel";
                    gf = "gf-pixel";
                default:
                    bf = "bf";
                    gf = "gf";
            }

            switch (songsList[num].split(":")[2])
            {
                case "2":
                    stage = "halloween";
                case "3":
                    stage = "philly";
                case "4":
                    stage = "limo";
                case "5":
                    if (songsList[num].split(":")[0] == "winter-horrorland")
                    {
                        stage = "mall-evil";
                    }
                    else
                    {
                        stage = "mall";
                    }
                case "6":
                    if (songsList[num].split(":")[0] == "thorns")
                    {
                        stage = "school-evil";
                    }
                    else
                    {
                        stage = "school";
                    }
                default:
                    stage = "stage";
            }

            FlxG.switchState(new PlayState(songsList[num].split(":")[0], bf, songsList[num].split(":")[1], gf, stage));
        });
    }
}