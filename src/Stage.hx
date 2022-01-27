package;

import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.FlxSprite;

class Stage extends FlxTypedGroup<FlxSprite>
{
    public function new(stage:String)
    {
        super();

        switch (stage)
        {
            default:
                var bg:FlxSprite = new FlxSprite().loadGraphic("stageback", "shared");
                bg.antialiasing = Config.antialiasing;
                bg.setGraphicSize(Std.int(bg.width * 2), Std.int(bg.height * 2));
                bg.screenCenter();
                add(bg);
                var front:FlxSprite = new FlxSprite().loadGraphic("stagefront", "shared");
                front.antialiasing = Config.antialiasing;
                add(front);
                var curtain:FlxSprite = new FlxSprite().loadGraphic("stagecurtains", "shared");
                curtain.antialiasing = Config.antialiasing;
                add(curtain);
        }
    }
}