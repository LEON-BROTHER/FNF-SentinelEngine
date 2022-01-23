package;

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
                alpha.songID = song;
                alpha.songLetterOffset = letter;
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
    }

    public function selectItem(num:Int)
    {
        item = num;
    
        if (item < 0)
        {
            item = songsList.length - 1;
        }

        if (item > songsList.length - 1)
        {
            item = 0;
        }

        FlxTween.cancelTweensOf(bg);

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

        FlxG.sound.playMusic(Files.inst(songsList[item].split(":")[0])); //TODO: Fix This Fucking Bullshit Not Loading

        for (num in 0...text.length)
        {
            FlxTween.tween(text.members[num], {y: 450 + ((text.members[num].songID - item) * 160)}, 1.5, {
                ease: FlxEase.expoOut,
            });
            FlxTween.tween(text.members[num], {x: 110 + (12 * (text.members[num].songID - item)) + (50 * text.members[num].songLetterOffset)}, 1.5, {
                ease: FlxEase.expoOut,
            });
        }

        for (num in 0...iconz.length)
        {
            FlxTween.tween(iconz.members[num], {y: 450 + (num - item) * 160}, 1.5, {
                ease: FlxEase.expoOut,
            });
            FlxTween.tween(iconz.members[num], {x: (songsList[item].split(":")[0].length * 50) + (12 * (num - item)) + (50 * text.members[num].songLetterOffset)}, 1.5, {
                ease: FlxEase.expoOut,
            });
        }
    }

    public function select(num:Int)
    {
        FlxG.sound.play(Files.sound("confirmMenu", "preload"));

        /*switch(menuData[num])
        {
            case "story mode":
                new FlxTimer().start(1.5, function(tmr:FlxTimer) {
                    FlxG.switchState(new StoryModeState());
                });
        }*/
    }
}