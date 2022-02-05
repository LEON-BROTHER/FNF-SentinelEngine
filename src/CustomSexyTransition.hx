package;

import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;
import flixel.util.FlxGradient;
import flixel.util.FlxColor;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxSubState;

class CustomSexyTransition extends FlxSubState
{
    public var intro:Bool;
    public var black:FlxSprite;
    public var gradient:FlxSprite;

    public function new(intro:Bool)
    {
        super();

        this.intro = intro;

        var temp:Float = FlxG.camera.zoom;
        if (temp < 0.05)
        {
            temp = 0.05;
        }
        else if (temp > 1)
        {
            temp = 1;
        }
        var zoom:Float = temp;
        var width:Int = Std.int(FlxG.width / zoom);
        var height:Int = Std.int(FlxG.height / zoom);

        black = new FlxSprite().makeGraphic(width, height + 400, FlxColor.BLACK);
        black.scrollFactor.set();
        add(black);

        var colors:Array<FlxColor> = [];

        if (intro)
        {
            colors = [0x00000000, FlxColor.BLACK];
        }
        else
        {
            colors = [FlxColor.BLACK, 0x00000000];
        }

        gradient = FlxGradient.createGradientFlxSprite(width, height, colors);
        gradient.scrollFactor.set();
        add(gradient);

        gradient.x -= (width - FlxG.width) / 2;
        black.x = gradient.x;

        if (intro)
        {
            gradient.y = black.y - black.height;
            FlxTween.tween(gradient, {y: gradient.height + 50}, 0.7, {
                ease: FlxEase.linear
            });
        }
        else
        {
            gradient.y = -gradient.height;
            black.y = gradient.y - black.height + 50;
            FlxTween.tween(gradient, {y: gradient.height + 50}, 0.7, {
                ease: FlxEase.linear
            });
        }
    }

    override function update(elapsed:Float)
    {
        super.update(elapsed);

        if(intro)
        {
            black.y = gradient.y + gradient.height;
        }
        else
        {
            black.y = gradient.y - black.height;
        }
    }
}