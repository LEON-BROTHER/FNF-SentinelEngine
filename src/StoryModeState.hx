package;

import flixel.FlxG;

class StoryModeState extends FunkinState
{
    public function new()
    {
        super();
    }

    override function create()
    {
        super.create();

        #if desktop
        Discord.UpdateStatus("In The Menu", "In The Story Mode Menu");
        #end
    }

    override function update(elapsed:Float)
    {
        super.update(elapsed);

        if (FlxG.keys.justPressed.ESCAPE)
        {
            FlxG.sound.play(Files.sound("cancelMenu", "preload"));
            FunkinState.switchState(new MainMenuState());
        }
    }
}