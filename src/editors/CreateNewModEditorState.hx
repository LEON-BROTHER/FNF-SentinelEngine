package editors;

#if sys
import sys.FileSystem;
#end

import flixel.text.FlxText;
import flixel.util.FlxColor;
import flixel.addons.ui.FlxInputText;
import flixel.FlxState;
import flixel.FlxG;

class CreateNewModEditorState extends FlxState
{
    private var name:FlxInputText;

    public function new()
    {
        super();
    }

    override function create()
    {
        super.create();

        var title:FlxText = new FlxText(0, 0, 1280, "Enter The Name Of Your Newly Created Mod", 48, true);
        title.setFormat(Files.font("vcr.ttf"), 48, FlxColor.WHITE, FlxTextAlign.CENTER, FlxTextBorderStyle.NONE, FlxColor.TRANSPARENT, true);
        title.screenCenter();
        add(title);
        title.y = 50;

        name = new FlxInputText(0, 0, 500, null, 24, FlxColor.BLACK, FlxColor.WHITE, true);
        name.setFormat(Files.font("vcr.ttf"), 24, FlxColor.BLACK, FlxTextAlign.LEFT, FlxTextBorderStyle.NONE, FlxColor.TRANSPARENT, true);
        name.screenCenter();
        add(name);
        name.y -= 100;
    }

    public function createMod()
    {
        #if sys
        if (FileSystem.exists("mods/" + name.text))
        {
            FlxG.sound.play(Files.sound("confirmMenu", "preload"));
            FileSystem.createDirectory("mods/" + name.text);
            FlxG.switchState(new ModsMenuState());
        }
        #end
    }
}