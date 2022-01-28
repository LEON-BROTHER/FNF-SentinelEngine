package;

import flixel.FlxSprite;

class HealthIcon extends FlxSprite
{
    public function new(character:String)
    {
        super();

        antialiasing = Config.antialiasing;
        loadGraphic(Files.image("icons/icon-" + character, "preload"), true, 150, 150);
        animation.pause();

        neutral();
    }

    public function neutral()
    {
        animation.frameIndex = 0;
    }
}