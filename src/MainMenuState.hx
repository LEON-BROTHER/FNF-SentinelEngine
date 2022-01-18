package;

import flixel.util.FlxTimer;
import flixel.FlxG;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;
import flixel.FlxSprite;
import flixel.FlxState;

class MainMenuState extends FlxState
{
    #if desktop
    private var menuData:Array<String> = ["story mode", "freeplay", "donate", "achievements", "credits", "mods", "workshop", "options"];
    #else
    private var menuData:Array<String> = ["story mode", "freeplay", "achievements", "credits", "options"];
    #end

    private var item:Int;

    private var bg:FlxSprite;

    public function new()
    {
        super();
    }

    override function create()
    {
        super.create();

        bg = new FlxSprite().loadGraphic(Files.image("menuBG", "preload"));
        bg.antialiasing = Config.antialiasing;
        bg.screenCenter();
        add(bg);

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
            item = menuData.length - 1;
        }

        if (item > menuData.length - 1)
        {
            item = 0;
        }

        FlxTween.cancelTweensOf(bg);

        FlxTween.tween(bg, {y: (item - (item * 2)) * 24}, 1.5, {
            ease: FlxEase.expoOut,
        });
    }

    public function select(num:Int)
    {
        FlxG.sound.play(Files.sound("confirmMenu", "preload"));

        switch(menuData[num])
        {
            case "story mode":
                new FlxTimer().start(1.5, function(tmr:FlxTimer) {
                    FlxG.switchState(new StoryModeState());
                });
            case "freeplay":
                new FlxTimer().start(1.5, function(tmr:FlxTimer) {
                    FlxG.switchState(new FreeplayState());
                });
            case "donate":
                FlxG.openURL("https://ninja-muffin24.itch.io/funkin");
            case "achievements":
                new FlxTimer().start(1.5, function(tmr:FlxTimer) {
                    FlxG.switchState(new AchievementsState());
                });
            case "credits":
                new FlxTimer().start(1.5, function(tmr:FlxTimer) {
                    FlxG.switchState(new CreditsState());
                });
            case "mods":
                new FlxTimer().start(1.5, function(tmr:FlxTimer) {
                    FlxG.switchState(new ModsMenuState());
                });
            case "workshop":
                new FlxTimer().start(1.5, function(tmr:FlxTimer) {
                    FlxG.switchState(new WorkshopState());
                });
            case "options":
                new FlxTimer().start(1.5, function(tmr:FlxTimer) {
                    FlxG.switchState(new OptionsState());
                });
        }
    }
}