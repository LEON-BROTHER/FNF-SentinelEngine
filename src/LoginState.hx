package;

import flixel.addons.ui.FlxInputText;
import flixel.ui.FlxButton;
import flixel.util.FlxColor;
import flixel.FlxG;
import flixel.text.FlxText;
import flixel.FlxState;

class LoginState extends FlxState
{
    private var username:FlxInputText;
    private var password:FlxInputText;

    public function new()
    {
        super();
    }

    override function create()
    {
        super.create();

        var title:FlxText = new FlxText(0, 0, 1280, "Log Into Your Sentinel Account", 48, true);
        title.setFormat(Files.font("vcr.ttf"), 48, FlxColor.WHITE, FlxTextAlign.CENTER, FlxTextBorderStyle.NONE, FlxColor.TRANSPARENT, true);
        title.screenCenter();
        add(title);
        title.y = 50;

        var signUp:FlxButton = new FlxButton(0, 0, "Don't Have An Account Yet? Sign Up, It's Free!", signup);
        signUp.setSize(640, 140);
        signUp.scale.x = 9;
        signUp.scale.y = 2;
        signUp.label.fieldWidth *= 9;
        signUp.updateHitbox();
        signUp.label.setFormat(Files.font("vcr.ttf"), 24, FlxColor.GRAY, FlxTextAlign.CENTER, FlxTextBorderStyle.NONE, FlxColor.TRANSPARENT, true);
        signUp.screenCenter();
        add(signUp);
        signUp.y += 300;

        var skip:FlxButton = new FlxButton(0, 0, "Skip Login", skipLogin);
        skip.setSize(310, 140);
        skip.scale.x = 4;
        skip.scale.y = 2;
        skip.label.fieldWidth *= 4;
        skip.updateHitbox();
        skip.label.setFormat(Files.font("vcr.ttf"), 24, FlxColor.GRAY, FlxTextAlign.CENTER, FlxTextBorderStyle.NONE, FlxColor.TRANSPARENT, true);
        skip.screenCenter();
        add(skip);
        skip.y += 210;

        username = new FlxInputText(0, 0, 500, null, 24, FlxColor.BLACK, FlxColor.WHITE, true);
        username.setFormat(Files.font("vcr.ttf"), 24, FlxColor.BLACK, FlxTextAlign.LEFT, FlxTextBorderStyle.NONE, FlxColor.TRANSPARENT, true);
        username.screenCenter();
        add(username);
        username.y -= 100;

        password = new FlxInputText(0, 0, 500, null, 24, FlxColor.BLACK, FlxColor.WHITE, true);
        password.setFormat(Files.font("vcr.ttf"), 24, FlxColor.BLACK, FlxTextAlign.LEFT, FlxTextBorderStyle.NONE, FlxColor.TRANSPARENT, true);
        password.screenCenter();
        add(password);
        password.y += 25;
    }

    public function login()
    {
        //IDK
    }

    public function signup()
    {
        FlxG.switchState(new SignupState());
    }

    public function skipLogin()
    {
        FlxG.sound.play(Files.sound("cancelMenu", "preload"));
        FlxG.switchState(new TitleState(false));
    }
}