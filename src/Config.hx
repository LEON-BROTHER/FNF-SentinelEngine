package;

import flixel.FlxG;

class Config
{
    public static var antialiasing:Bool;

    public static function loadConfig()
    {
        FlxG.save.bind("FNF", "Generalisk");

        if (FlxG.save.data.antialiasing != null)
        {
            antialiasing = FlxG.save.data.antialiasing;
        }
    }

    public static function saveConfig()
    {
        FlxG.save.bind("FNF", "Generalisk");
        
        FlxG.save.data.antialiasing = antialiasing;
    }
}