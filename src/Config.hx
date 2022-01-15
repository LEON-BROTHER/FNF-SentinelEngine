package;

import openfl.display.DisplayObject;
import flixel.FlxG;

class Config
{
    public static var antialiasing:Bool;

    public static function loadConfig()
    {
        if (FlxG.save.data.antialiasing != null)
        {
            antialiasing = FlxG.save.data.antialiasing;
        }
    }

    public static function saveConfig()
    {
        FlxG.save.data.antialiasing = antialiasing;
    }
}