package;

import flixel.addons.ui.FlxInputText;
import flixel.ui.FlxButton;
import flixel.util.FlxColor;
import flixel.FlxG;
import flixel.text.FlxText;
import flixel.FlxState;

class SignupState extends FlxState
{
    private var username:FlxInputText;
    private var email:FlxInputText;
    private var password:FlxInputText;

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
        logIn.label.setFormat(Files.font("vcr.ttf"), 24, FlxColor.GRAY, FlxTextAlign.CENTER, FlxTextBorderStyle.NONE, FlxColor.TRANSPARENT, true);
        logIn.screenCenter();
        add(logIn);
        logIn.y += 300;

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
        username.y -= 200;

        email = new FlxInputText(0, 0, 500, null, 24, FlxColor.BLACK, FlxColor.WHITE, true); //TODO: Make It So That It Doesn't Use The American Keyboard Because I'm Bri'ish -Generalisk
        email.setFormat(Files.font("vcr.ttf"), 24, FlxColor.BLACK, FlxTextAlign.LEFT, FlxTextBorderStyle.NONE, FlxColor.TRANSPARENT, true);
        email.screenCenter();
        add(email);
        email.y -= 75;

        password = new FlxInputText(0, 0, 500, null, 24, FlxColor.BLACK, FlxColor.WHITE, true);
        password.setFormat(Files.font("vcr.ttf"), 24, FlxColor.BLACK, FlxTextAlign.LEFT, FlxTextBorderStyle.NONE, FlxColor.TRANSPARENT, true);
        password.screenCenter();
        add(password);
        password.y += 50;
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