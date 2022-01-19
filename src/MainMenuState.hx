package;

import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.util.FlxTimer;
import flixel.FlxG;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;
import flixel.FlxSprite;
import flixel.FlxState;

using StringTools;

class MainMenuState extends FlxState
{
    #if desktop
    private var menuData:Array<String> = ["story mode", "freeplay", "donate", "achievements", "credits", "mods", "workshop", "options"];
    #else
    private var menuData:Array<String> = ["story mode", "freeplay", "achievements", "credits", "options"];
    #end

    private var item:Int;

    private var bg:FlxSprite;

    private var menuButtons:FlxTypedGroup<FlxSprite>;

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

        menuButtons = new FlxTypedGroup<FlxSprite>();
        add(menuButtons);

        for (num in 0...menuData.length)
        {
            var id:String = menuData[num].toLowerCase().replace(" ", "-");
            var button:FlxSprite = new FlxSprite();
            button.antialiasing = Config.antialiasing;
            button.centerOrigin();
            button.frames = Files.getSparrowAtlas("mainmenu/menu_" + id, "preload");
            button.animation.addByPrefix("idle", id + " idle", 24, true);
            button.animation.addByPrefix("selected", id + " selected", 24, true);
            button.animation.play("idle");
            menuButtons.add(button);
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
            item = menuData.length - 1;
        }

        if (item > menuData.length - 1)
        {
            item = 0;
        }

        FlxTween.cancelTweensOf(bg);

        for (num in 0...menuData.length)
        {
            FlxTween.cancelTweensOf(menuButtons.members[num]);
        }

        var int:Int = 0;
        if (item < 3)
        {
            int = 0;
        }
        else if (item > menuData.length - 4)
        {
            int = menuData.length - 4;
        }
        else
        {
            int = item - 3;
        }

        FlxTween.tween(bg, {y: ((int - 2) - ((int - 2) * 2)) * (40 / (menuData.length - 6))}, 1.5, {
            ease: FlxEase.expoOut,
        });

        for (num in 0...menuData.length)
        {
            FlxTween.tween(menuButtons.members[num], {y: 69 + ((num - item) * 130)}, 1.5, {
                ease: FlxEase.expoOut,
            });

            if (num == item)
            {
                menuButtons.members[num].animation.play("selected");
            }
            else
            {
                menuButtons.members[num].animation.play("idle");
            }
        }
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