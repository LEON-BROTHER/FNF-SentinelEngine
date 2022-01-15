package;

import flixel.ui.FlxButton;
import flixel.util.FlxColor;
import flixel.FlxG;
import flixel.text.FlxText;
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

        var logIn:FlxButton = new FlxButton(0, 0, "Log In", login);
        logIn.setSize(175, 75);
        logIn.screenCenter();
        add(logIn);
        logIn.y -= 100;

        var signUp:FlxButton = new FlxButton(0, 0, "Sign Up", signup);
        signUp.setSize(175, 75);
        signUp.screenCenter();
        add(signUp);
        signUp.y += 100;
    }

    public function login():Void
    {
        FlxG.switchState(new LoginState());
    }

    public function signup():Void
    {
        FlxG.switchState(new SignupState());
    }
}