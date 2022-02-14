package;

import flixel.FlxG;

class WorkshopState extends FunkinState
{
    public function new()
    {
        super();
    }

    override function create()
    {
        super.create();

        #if desktop
        Discord.UpdateStatus("Browsing The Workshop", null);
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