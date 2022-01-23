package;

import flixel.FlxG;
import flixel.FlxState;

class AchievementsState extends FlxState
{
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