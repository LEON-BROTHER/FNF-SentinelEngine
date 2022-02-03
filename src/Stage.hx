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
                camZoom = 0.6;

                var bg:FlxSprite = new FlxSprite().loadGraphic(Files.image("philly/sky", "week3"));
                bg.antialiasing = Config.antialiasing;
                bg.setGraphicSize(Std.int(bg.width * 1.75), Std.int(bg.height * 1.75));
                bg.scrollFactor.set(0.7, 0.7);
                bg.screenCenter();
                add(bg);

                if (!Config.lowquality)
                {
                    var city:FlxSprite = new FlxSprite().loadGraphic(Files.image("philly/city", "week3"));
                    city.antialiasing = Config.antialiasing;
                    city.setGraphicSize(Std.int(city.width * 1.75), Std.int(city.height * 1.75));
                    city.scrollFactor.set(0.8, 0.8);
                    city.screenCenter();
                    add(city);
                    city.y += 50;

                    var behindTrain:FlxSprite = new FlxSprite().loadGraphic(Files.image("philly/behindTrain", "week3"));
                    behindTrain.antialiasing = Config.antialiasing;
                    behindTrain.setGraphicSize(Std.int(behindTrain.width * 1.75), Std.int(behindTrain.height * 1.75));
                    behindTrain.scrollFactor.set(0.9, 0.9);
                    behindTrain.screenCenter();
                    add(behindTrain);
                    behindTrain.y += 50;
                }

                var street:FlxSprite = new FlxSprite().loadGraphic(Files.image("philly/street", "week3"));
                street.antialiasing = Config.antialiasing;
                street.setGraphicSize(Std.int(street.width * 1.75), Std.int(street.height * 1.75));
                street.scrollFactor.set(0.9, 0.9);
                street.screenCenter();
                add(street);
                street.y += 50;
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