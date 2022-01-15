package;

import flixel.FlxG;

class Config
{
    public static var antialiasing:Bool;

    public static function loadConfig()
    {
        antialiasing = FlxG.save.data.antialiasing;
        if (antialiasing == null)
        {
            antialiasing = false;
        }
    }

    public static function saveConfig()
    {
        FlxG.save.data.antialiasing = antialiasing;
    }
}