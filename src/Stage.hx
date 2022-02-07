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

                    var window:FlxSprite = new FlxSprite().loadGraphic(Files.image("philly/win0", "week3"));
                    window.antialiasing = Config.antialiasing;
                    window.setGraphicSize(Std.int(window.width * 1.75), Std.int(window.height * 1.75));
                    window.scrollFactor.set(0.8, 0.8);
                    window.screenCenter();
                    add(window);
                    window.y += 50;

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
            case "limo":
                camZoom = 0.95;

                var bg:FlxSprite = new FlxSprite().loadGraphic(Files.image("limo/limoSunset", "week4"));
                bg.antialiasing = Config.antialiasing;
                bg.setGraphicSize(Std.int(bg.width * 1.75), Std.int(bg.height * 1.75));
                bg.scrollFactor.set(0.7, 0.7);
                bg.screenCenter();
                add(bg);
                bg.x -= 360;

                if (!Config.lowquality)
                {
                    var bgLimo:FlxSprite = new FlxSprite();
                    bgLimo.frames = Files.getSparrowAtlas("limo/bgLimo", "week4");
                    bgLimo.animation.addByPrefix("idle", "background limo pink", 24, true);
                    bgLimo.animation.play("idle");
                    bgLimo.antialiasing = Config.antialiasing;
                    bgLimo.scrollFactor.set(0.8, 0.8);
                    bgLimo.screenCenter();
                    add(bgLimo);
                    bgLimo.x -= 50;
                    bgLimo.y += 540;

                    var x = -320;

                    for (i in 0...4)
                    {
                        var dancer:FlxSprite = new FlxSprite();
                        dancer.frames = Files.getSparrowAtlas("limo/limoDancer", "week4");
                        dancer.animation.addByPrefix("idle", "bg dancer sketch PINK", 24, true);
                        dancer.animation.play("idle");
                        dancer.antialiasing = Config.antialiasing;
                        dancer.scrollFactor.set(0.8, 0.8);
                        dancer.screenCenter();
                        add(dancer);
                        dancer.x += x;
                        dancer.y += 180;

                        x += 400;
                    }
                }

                var limo:FlxSprite = new FlxSprite();
                limo.frames = Files.getSparrowAtlas("limo/limoDrive", "week4");
                if (!Config.lowquality)
                {
                    limo.animation.addByPrefix("idle", "Limo stage", 24, true);
                    limo.animation.play("idle");
                }
                limo.antialiasing = Config.antialiasing;
                limo.scrollFactor.set(0.9, 0.9);
                limo.screenCenter();
                add(limo);
                limo.x += 180;
                limo.y += 640;
            case "mall":
                camZoom = 0.8;

                var bg:FlxSprite = new FlxSprite().loadGraphic(Files.image("christmas/bgWalls", "week5"));
                bg.antialiasing = Config.antialiasing;
                bg.scrollFactor.set(0.6, 0.6);
                bg.screenCenter();
                add(bg);

                if (!Config.lowquality)
                {
                    var topDancers:FlxSprite = new FlxSprite();
                    topDancers.frames = Files.getSparrowAtlas("christmas/upperBop", "week5");
                    topDancers.animation.addByPrefix("idle", "Upper Crowd Bob", 24, true);
                    topDancers.animation.play("idle");
                    topDancers.antialiasing = Config.antialiasing;
                    topDancers.scrollFactor.set(0.7, 0.7);
                    topDancers.screenCenter();
                    add(topDancers);

                    var escalator:FlxSprite = new FlxSprite().loadGraphic(Files.image("christmas/bgEscalator", "week5"));
                    escalator.antialiasing = Config.antialiasing;
                    escalator.scrollFactor.set(0.7, 0.7);
                    escalator.screenCenter();
                    add(escalator);
                    escalator.y += 150;

                    var tree:FlxSprite = new FlxSprite().loadGraphic(Files.image("christmas/christmasTree", "week5"));
                    tree.antialiasing = Config.antialiasing;
                    tree.scrollFactor.set(0.65, 0.65);
                    tree.screenCenter();
                    add(tree);
                }

                var snow:FlxSprite = new FlxSprite().loadGraphic(Files.image("christmas/fgSnow", "week5"));
                snow.antialiasing = Config.antialiasing;
                snow.scrollFactor.set(0.9, 0.9);
                snow.screenCenter();
                add(snow);
                snow.y += 690;

                var snow2:FlxSprite = new FlxSprite().loadGraphic(Files.image("christmas/fgSnow", "week5"));
                snow2.antialiasing = Config.antialiasing;
                snow2.scrollFactor.set(0.9, 0.9);
                snow2.screenCenter();
                add(snow2);
                snow2.y += 740;

                if (!Config.lowquality)
                {
                    var bottomDancers:FlxSprite = new FlxSprite();
                    bottomDancers.frames = Files.getSparrowAtlas("christmas/bottomBop", "week5");
                    bottomDancers.animation.addByPrefix("idle", "Bottom Level Boppers", 24, true);
                    bottomDancers.animation.play("idle");
                    bottomDancers.antialiasing = Config.antialiasing;
                    bottomDancers.scrollFactor.set(0.8, 0.8);
                    bottomDancers.screenCenter();
                    add(bottomDancers);
                    bottomDancers.y += 450;
                }

                var santa:FlxSprite = new FlxSprite();
                santa.frames = Files.getSparrowAtlas("christmas/santa", "week5");
                if (!Config.lowquality)
                {
                    santa.animation.addByPrefix("idle", "santa idle in fear", 24, true);
                    santa.animation.play("idle");
                }
                santa.antialiasing = Config.antialiasing;
                santa.scrollFactor.set(0.8, 0.8);
                santa.screenCenter();
                add(santa);
                santa.x -= 640;
                santa.y += 420;
            case "mall-evil":
                camZoom = 0.8;

                var bg:FlxSprite = new FlxSprite().loadGraphic(Files.image("christmas/christmasButSpoopy/evilBG", "week5"));
                bg.antialiasing = Config.antialiasing;
                bg.scrollFactor.set(0.6, 0.6);
                bg.screenCenter();
                add(bg);

                if (!Config.lowquality)
                {
                    var tree:FlxSprite = new FlxSprite().loadGraphic(Files.image("christmas/christmasButSpoopy/evilTree", "week5"));
                    tree.antialiasing = Config.antialiasing;
                    tree.scrollFactor.set(0.65, 0.65);
                    tree.screenCenter();
                    add(tree);
                }

                var snow:FlxSprite = new FlxSprite().loadGraphic(Files.image("christmas/christmasButSpoopy/evilSnow", "week5"));
                snow.antialiasing = Config.antialiasing;
                snow.scrollFactor.set(0.9, 0.9);
                snow.screenCenter();
                add(snow);
                snow.y += 690;

                var snow2:FlxSprite = new FlxSprite().loadGraphic(Files.image("christmas/christmasButSpoopy/evilSnow", "week5"));
                snow2.antialiasing = Config.antialiasing;
                snow2.scrollFactor.set(0.9, 0.9);
                snow2.screenCenter();
                add(snow2);
                snow2.y += 740;
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