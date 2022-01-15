package;

import flixel.ui.FlxButton;
import flixel.util.FlxColor;
import flixel.FlxG;
import flixel.text.FlxText;
import flixel.FlxState;

class SignupState extends FlxState
{
    public function new()
    {
        super();
    }

    override function create()
    {
        super.create();

        var title:FlxText = new FlxText(0, 0, 1280, "Create A Sentinel Account", 48, true);
        title.setFormat(Files.font("vcr.ttf"), 48, FlxColor.WHITE, FlxTextAlign.CENTER, FlxTextBorderStyle.NONE, FlxColor.TRANSPARENT, true);
        title.screenCenter();
        add(title);
        title.y = 50;

        var logIn:FlxButton = new FlxButton(0, 0, "Already Have An Account? Login!", login);
        logIn.setSize(640, 140);
        logIn.scale.x = 7;
        logIn.scale.y = 2;
        logIn.label.fieldWidth *= 7;
        logIn.updateHitbox();
        logIn.label.setFormat(null, 24, FlxColor.GRAY, FlxTextAlign.CENTER, FlxTextBorderStyle.NONE, FlxColor.TRANSPARENT, true);
        logIn.screenCenter();
        add(logIn);
        logIn.y += 300;

        var skip:FlxButton = new FlxButton(0, 0, "Skip Login", skipLogin);
        skip.setSize(310, 140);
        skip.updateHitbox();
        skip.screenCenter();
        add(skip);
        skip.y += 210;
    }

    public function login():Void
    {
        FlxG.switchState(new LoginState());
    }

    public function skipLogin():Void
    {
        FlxG.switchState(new TitleState());
    }
}