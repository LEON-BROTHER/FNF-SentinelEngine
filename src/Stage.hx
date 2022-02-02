package;

import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.FlxSprite;

class Stage extends FlxTypedGroup<FlxSprite>
{
    public var camZoom = 0.65;
    public function new(stage:String)
    {
        super();

        switch (stage)
        {
            case "halloween":
                camZoom = 0.8;

                var bg:FlxSprite = new FlxSprite();
                bg.frames = Files.getSparrowAtlas("halloween_bg", "week2");
                bg.antialiasing = Config.antialiasing;
                bg.setGraphicSize(Std.int(bg.width * 1.5), Std.int(bg.height * 1.5));
                bg.scrollFactor.set(0.9, 0.9);
                bg.screenCenter();
                add(bg);
            case "philly":
                camZoom = 0.8;

                var bg:FlxSprite = new FlxSprite().loadGraphic(Files.image("philly/sky", "week3"));
                bg.antialiasing = Config.antialiasing;
                bg.setGraphicSize(Std.int(bg.width * 1.1), Std.int(bg.height * 1.1));
                bg.scrollFactor.set(0.8, 0.8);
                bg.screenCenter();
                add(bg);
                var city:FlxSprite = new FlxSprite().loadGraphic(Files.image("philly/city", "week3"));
                city.antialiasing = Config.antialiasing;
                city.setGraphicSize(Std.int(city.width * 1.1), Std.int(city.height * 1.1));
                city.scrollFactor.set(0.9, 0.9);
                city.screenCenter();
                add(city);
            default:
                camZoom = 0.75;

                var bg:FlxSprite = new FlxSprite().loadGraphic(Files.image("stageback", "shared"));
                bg.antialiasing = Config.antialiasing;
                bg.setGraphicSize(Std.int(bg.width * 1.1), Std.int(bg.height * 1.1));
                bg.scrollFactor.set(0.8, 0.8);
                bg.screenCenter();
                add(bg);

                var front:FlxSprite = new FlxSprite().loadGraphic(Files.image("stagefront", "shared"));
                front.antialiasing = Config.antialiasing;
                front.setGraphicSize(Std.int(front.width * 1.1), Std.int(front.height * 1.1));
                front.scrollFactor.set(0.9, 0.9);
                front.screenCenter();
                add(front);
                front.y += 640;

                if (!Config.lowquality)
                {
                    var curtain:FlxSprite = new FlxSprite().loadGraphic(Files.image("stagecurtains", "shared"));
                    curtain.antialiasing = Config.antialiasing;
                    curtain.setGraphicSize(Std.int(curtain.width * 1.1), Std.int(curtain.height * 1.1));
                    curtain.scrollFactor.set(0.9, 0.9);
                    curtain.screenCenter();
                    add(curtain);
                }
        }
    }
}