package editors;

import lime.app.Application;
#if MODS_ALLOWED
import sys.io.FileOutput;
import sys.FileSystem;
import sys.io.File;
#end

import flixel.ui.FlxButton;
import flixel.text.FlxText;
import flixel.util.FlxColor;
import flixel.addons.ui.FlxInputText;
import flixel.FlxG;

using StringTools;

class CreateNewModEditorState extends FunkinState
{
    private var name:FlxInputText;
    private var author:FlxInputText;
    private var version:FlxInputText;

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

        author = new FlxInputText(0, 0, 500, null, 24, FlxColor.BLACK, FlxColor.WHITE, true);
        author.setFormat(Files.font("vcr.ttf"), 24, FlxColor.BLACK, FlxTextAlign.LEFT, FlxTextBorderStyle.NONE, FlxColor.TRANSPARENT, true);
        author.screenCenter();
        add(author);

        version = new FlxInputText(0, 0, 500, null, 24, FlxColor.BLACK, FlxColor.WHITE, true);
        version.setFormat(Files.font("vcr.ttf"), 24, FlxColor.BLACK, FlxTextAlign.LEFT, FlxTextBorderStyle.NONE, FlxColor.TRANSPARENT, true);
        version.screenCenter();
        add(version);
        version.y += 100;
    }

    public function createMod()
    {
        #if MODS_ALLOWED
        if (!FileSystem.exists("mods/" + name.text))
        {
            FlxG.sound.play(Files.sound("confirmMenu", "preload"));
            FileSystem.createDirectory("mods/" + name.text.toLowerCase().replace(" ", "-"));
            var config:FileOutput = File.write("mods/" + name.text.toLowerCase().replace(" ", "-") + "/mod.config", false);
            config.writeString("ModConfig\n{\n\tid:\t" + name.text.toLowerCase().replace(" ", "-") + "\n\tname:\t" + name.text + "\n\tauthor:\t" + author.text + "\n\tversion:\t" + version.text + "\n\tsentinelVer:\t" + Application.current.meta.get("version") + "\n}");
            config.close();
            FunkinState.switchState(new ModsMenuState());
        }
        #end
    }
}