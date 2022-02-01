package;

import flixel.FlxG;

/*enum Quality{
    Low;
    Medium;
    High;
}*/

class Config
{
    public static var antialiasing:Bool = true;
    public static var lowquality:Bool = false;
    public static var recordreplays:Bool = true;
    public static var cachereplayfiles:Bool = true;
    public static var downscroll:Bool = false;

    public static function loadConfig()
    {
        FlxG.save.bind("FNF", "Generalisk");

        if (FlxG.save.data.antialiasing != null)
        {
            antialiasing = FlxG.save.data.antialiasing;
        }

        if (FlxG.save.data.lowquality != null)
        {
            lowquality = FlxG.save.data.lowquality;
        }

        if (FlxG.save.data.recordreplays != null)
        {
            recordreplays = FlxG.save.data.recordreplays;
        }

        if (FlxG.save.data.cachereplayfiles != null)
        {
            cachereplayfiles = FlxG.save.data.cachereplayfiles;
        }

        if (FlxG.save.data.downscroll != null)
        {
            downscroll = FlxG.save.data.downscroll;
        }
    }

    public static function saveConfig()
    {
        FlxG.save.bind("FNF", "Generalisk");

        FlxG.save.data.antialiasing = antialiasing;
        FlxG.save.data.lowquality = lowquality;
        FlxG.save.data.recordreplays = recordreplays;
        FlxG.save.data.cachereplayfiles = cachereplayfiles;
        FlxG.save.data.downscroll = downscroll;
    }

    inline static public function getValueByName(name:String):Dynamic
    {
        switch (name)
        {
            case "Anti-Aliasing":
                return antialiasing;
            case "Low Quality":
                return lowquality;
            case "Record Replay's":
                return recordreplays;
            case "Cache Replay File's":
                return cachereplayfiles;
            case "Down Scroll":
                return downscroll;
            default:
                return "404-Invalid";
        }
    }
}