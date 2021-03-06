package;

#if sys
import sys.io.File;
import sys.FileSystem;
#else
import openfl.utils.Assets;
#end

import editors.MainEditorState;
import lime.app.Application;
import flixel.util.FlxColor;
import flixel.text.FlxText;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.util.FlxTimer;
import flixel.FlxG;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;
import flixel.FlxSprite;

using StringTools;

class MainMenuState extends FunkinState
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

        #if desktop
        Discord.UpdateStatus("In The Menu", "In The Main Menu");
        #end
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
            button.frames = Files.getSparrowAtlas("mainmenu/menu_" + id, "preload");
            button.animation.addByPrefix("idle", id + " idle", 24, true);
            button.animation.addByPrefix("selected", id + " selected", 24, true);
            button.animation.play("idle");
            menuButtons.add(button);
        }

        #if MODS_ALLOWED
        var temp:Array<String> = Files.getModsList();
        var txt:FlxText = new FlxText(0, FlxG.height * 0.96, 1280, "Friday Night Funkin' Sentinel Engine Version " + Application.current.meta.get("version") + ": " + temp.length + " Mod(s) Active!", 24, true);

        var invalid:String = "";
        for (mod in 0...temp.length)
        {
            if (invalid == "")
            {
                var textFile:Array<String> = [];
                var temper:Array<String> = [];

                #if sys
		        if(FileSystem.exists("mods/" + temp[mod] + "/mod.config")) temper = File.getContent("mods/" + temp[mod] + "/mod.config").trim().split('\n');
		        #else
		        if(Assets.exists("mods/" + temp[mod] + "/mod.config")) temper = Assets.getText("mods/" + temp[mod] + "/mod.config").trim().split('\n');
		        #end

		        for (i in 0...temper.length)
		        {
			        textFile.insert(textFile.length + 10, temper[i].trim());
		        }

                var detected:Bool = false;
                for (line in 0...textFile.length)
                {
                    if (!detected)
                    {
                        var textago:Array<String> = textFile[line].split("\t");

                        if (textago[textago.length - 2] == "sentinelVer:")
                        {
                            detected = true;
                            if (textago[textago.length - 1] != Application.current.meta.get("version"))
                            {
                                invalid = temp[mod].replace("-", " ").toUpperCase();
                            }
                        }
                    }
                }
            }
        }

        if (invalid != "")
        {
            var txt2:FlxText = new FlxText(0, FlxG.height * 0.87, 1280, "WARNING: 1 Or More Mod's (Including \"" + invalid + "\") Are Not On The Current Version Of Sentinel Engine. This May Cause Unforseen Consequences, Please Make Sure That Your Sentinel Engine Is Up-To-Date Or Try Reaching Out To The Mod Author To Update The Mod", 24, true);
            txt2.setFormat(Files.font("vcr.ttf"), 24, 0xFFAA0000, FlxTextAlign.LEFT, FlxTextBorderStyle.OUTLINE, FlxColor.BLACK, true);
            add(txt2);
        }
        #else
        var txt:FlxText = new FlxText(0, FlxG.height * 0.96, 1280, "Friday Night Funkin' Sentinel Engine Version " + Application.current.meta.get("version"), 24, true);
        #end
        txt.setFormat(Files.font("vcr.ttf"), 24, FlxColor.WHITE, FlxTextAlign.LEFT, FlxTextBorderStyle.OUTLINE, FlxColor.BLACK, true);
        add(txt);

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

        if (FlxG.keys.justPressed.SEVEN)
        {
            FunkinState.switchState(new MainEditorState());
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

        FlxTween.tween(bg, {y: ((int - 2) - ((int - 2) * 2)) * (35 / (menuData.length - 6))}, 1.5, {
            ease: FlxEase.expoOut,
        });

        for (num in 0...menuData.length)
        {
            FlxTween.tween(menuButtons.members[num], {x: Std.int(640 - (menuButtons.members[num].width / 2))}, 1.5, {
                ease: FlxEase.expoOut,
            });

            FlxTween.tween(menuButtons.members[num], {y: 69 + ((num - item) * 160)}, 1.5, {
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
                    FunkinState.switchState(new StoryModeState());
                });
            case "freeplay":
                new FlxTimer().start(1.5, function(tmr:FlxTimer) {
                    FunkinState.switchState(new FreeplayState());
                });
            case "donate":
                FlxG.openURL("https://ninja-muffin24.itch.io/funkin");
            case "achievements":
                new FlxTimer().start(1.5, function(tmr:FlxTimer) {
                    FunkinState.switchState(new AchievementsState());
                });
            case "credits":
                new FlxTimer().start(1.5, function(tmr:FlxTimer) {
                    FunkinState.switchState(new CreditsState());
                });
            case "mods":
                new FlxTimer().start(1.5, function(tmr:FlxTimer) {
                    FunkinState.switchState(new ModsMenuState());
                });
            case "workshop":
                new FlxTimer().start(1.5, function(tmr:FlxTimer) {
                    FunkinState.switchState(new WorkshopState());
                });
            case "options":
                new FlxTimer().start(1.5, function(tmr:FlxTimer) {
                    FunkinState.switchState(new OptionsState());
                });
        }
    }
}