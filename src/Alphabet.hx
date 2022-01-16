package;

import flixel.FlxSprite;

class Alphabet extends FlxSprite
{
    public function new(letter:String, ?bold:Bool = false)
    {
        super();

        screenCenter();
        frames = Files.getSparrowAtlas("alphabet", "preload");

        if (bold)
        {
            switch (letter)
            {
                default:
                    animation.addByPrefix("text", "A bold", 24, true);
            }
        }

        animation.play("text");
        antialiasing = Config.antialiasing;
    }

    public function calculatePosition(collumn:Int, totalCollumns:Int, row:Int, totalRows:Int)
    {
        screenCenter();
        var col:Int = collumn * 50;
        var totalCol:Int = totalCollumns * 50;
        var rohw:Int = row * 75;
        var totalRohw:Int = totalRows * 75;

        x -= (totalCol / 2) + col;
        y += (totalRohw / 2) + rohw;
    }
}