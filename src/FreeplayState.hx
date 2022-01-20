package;

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

        for (num in 0...songsList.length)
        {
            FlxTween.cancelTweensOf(songsList[num]);
        }

        FlxTween.tween(bg, {y: ((item - 2) - ((item - 2) * 2)) * (35 / (songsList.length - 1))}, 1.5, {
            ease: FlxEase.expoOut,
        });

        FlxG.sound.playMusic(Files.inst(songsList[item].split(":")[0]));
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