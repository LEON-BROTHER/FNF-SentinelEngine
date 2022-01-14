package;

import flixel.util.FlxColor;
import flixel.FlxG;
import flixel.text.FlxText;
import flixel.FlxSprite;
import flixel.FlxState;

class SignInState extends FlxState
{
    public function new()
    {
        super();
    }

    override function create()
    {
        super.create();

        var title:FlxText = new FlxText(0, 0, 1280, "Sign Into A Sentinel Account", 48, true);
        title.setFormat(Files.font("vcr.ttf"), 48, FlxColor.WHITE, FlxTextAlign.CENTER, FlxTextBorderStyle.NONE, FlxColor.TRANSPARENT, true);
        title.screenCenter();
        add(title);
        title.y = 50;

        var description:FlxText = new FlxText(0, 0, 1280, "It Appear's Your Not Logged Into A Sentinel Account, You Can Log In/Sign Up Now Or Skip The Sign In & Not Be Able To Access The Online Feature's (Workshop, Forum etc)", 24, true);
        description.setFormat(Files.font("vcr.ttf"), 24, FlxColor.WHITE, FlxTextAlign.CENTER, FlxTextBorderStyle.NONE, FlxColor.TRANSPARENT, true);
        description.screenCenter();
        add(description);
        description.y = 120;
    }
}