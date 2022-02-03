package editors;

#if sys
import sys.FileSystem;
#end

import flixel.ui.FlxButton;
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

        var createB:FlxButton = new FlxButton(0, 0, "Create Mod", createMod);
        createB.setSize(310, 140);
        createB.scale.x = 4;
        createB.scale.y = 2;
        createB.label.fieldWidth *= 4;
        createB.updateHitbox();
        createB.label.setFormat(Files.font("vcr.ttf"), 24, FlxColor.GRAY, FlxTextAlign.CENTER, FlxTextBorderStyle.NONE, FlxColor.TRANSPARENT, true);
        createB.screenCenter();
        add(createB);
        createB.y += 210;

        name = new FlxInputText(0, 0, 500, null, 24, FlxColor.BLACK, FlxColor.WHITE, true);
        name.setFormat(Files.font("vcr.ttf"), 24, FlxColor.BLACK, FlxTextAlign.LEFT, FlxTextBorderStyle.NONE, FlxColor.TRANSPARENT, true);
        name.screenCenter();
        add(name);
        name.y -= 100;
    }

    public function createMod()
    {
        #if sys
        if (!FileSystem.exists("mods/" + name.text))
        {
            FlxG.sound.play(Files.sound("confirmMenu", "preload"));
            FileSystem.createDirectory("mods/" + name.text);
            FlxG.switchState(new ModsMenuState());
        }
        #end
    }
}