package;

import flixel.FlxG;
import flixel.FlxState;

class OptionsState extends FlxState
{
    private var options:Array<Dynamic> = [
        ["Anti-Aliasing", BoolOptionType, "Enable/Disable Anti-Aliasing, Which Smoothes Out The Texture's To Make Them Look Less Pixelly"],
        ["Low Quality", BoolOptionType, "Enabling Increase's Performance, But Make's The Game Not Look As Good"],
        ["Record Replay's", BoolOptionType, "Enable/Disable Whether You Want The Game To Record Replay's"],
        ["Cache Replay File's", BoolOptionType, "Enable/Disable Whether You Want Your Replay To Have The Nessecary File's Stored Inside It (Song, Chart, Character's). Useful If You Want To Send Your Friend A Replay For A Mod Song."]
    ];

    public function new()
    {
        super();
    }

    override function update(elapsed:Float)
    {
        super.update(elapsed);

        if (FlxG.keys.justPressed.ESCAPE)
        {
            FlxG.sound.play(Files.sound("cancelMenu", "preload"));
            FlxG.switchState(new MainMenuState());
        }
    }
}

class OptionType
{
    public var title:String;
    public var description:String;

    public function new(titl:String, desc:String)
    {
        title = titl;
        description = desc;
    }
}

class BoolOptionType extends OptionType
{
    public function new(titl:String, desc:String)
    {
        super(titl, desc);
    }
}