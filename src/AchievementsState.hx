package;

import flixel.FlxG;

class AchievementsState extends FunkinState
{
    public function new()
    {
        super();
    }

    override function create()
    {
        super.create();

        #if desktop
        Discord.UpdateStatus("In The Menu", "In The Achievements Menu");
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