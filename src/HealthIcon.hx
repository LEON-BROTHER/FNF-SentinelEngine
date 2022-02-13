package;

#if sys
import sys.FileSystem;
#end

import flixel.FlxSprite;

class HealthIcon extends FlxSprite
{
    public function new(character:String)
    {
        super();

        antialiasing = Config.antialiasing;
        #if sys
        if (FileSystem.exists(Files.image("icons/icon-" + character, "preload")))
        #else
        if (Assets.exists(Files.image("icons/icon-" + character, "preload")))
        #end
        {
            loadGraphic(Files.image("icons/icon-" + character, "preload"), true, 150, 150);
        }
        else
        {
            loadGraphic(Files.image("icons/icon-null", "preload"), true, 150, 150);
        }
        animation.pause();

        neutral();
    }

    public function neutral()
    {
        animation.frameIndex = 0;
    }

    public function losing()
    {
        animation.frameIndex = 1;
    }

    public function winning()
    {
        animation.frameIndex = 2;
    }
}