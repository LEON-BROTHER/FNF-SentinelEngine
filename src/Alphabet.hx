package;

import flixel.FlxSprite;

class Alphabet extends FlxSprite
{
    public var songID:Int = -1;
    public var songLetterOffset:Int = -1;

    public function new(letter:String, ?bold:Bool = false)
    {
        super();

        screenCenter();
        frames = Files.getSparrowAtlas("alphabet", "preload");

        if (bold)
        {
            switch (letter.toLowerCase())
            {
                case "a":
                    animation.addByPrefix("text", "A bold", 24, true);
                case "b":
                    animation.addByPrefix("text", "B bold", 24, true);
                case "c":
                    animation.addByPrefix("text", "C bold", 24, true);
                case "d":
                    animation.addByPrefix("text", "D bold", 24, true);
                case "e":
                    animation.addByPrefix("text", "E bold", 24, true);
                case "f":
                    animation.addByPrefix("text", "F bold", 24, true);
                case "g":
                    animation.addByPrefix("text", "G bold", 24, true);
                case "h":
                    animation.addByPrefix("text", "H bold", 24, true);
                case "i":
                    animation.addByPrefix("text", "I bold", 24, true);
                case "j":
                    animation.addByPrefix("text", "J bold", 24, true);
                case "k":
                    animation.addByPrefix("text", "K bold", 24, true);
                case "l":
                    animation.addByPrefix("text", "L bold", 24, true);
                case "m":
                    animation.addByPrefix("text", "M bold", 24, true);
                case "n":
                    animation.addByPrefix("text", "N bold", 24, true);
                case "o":
                    animation.addByPrefix("text", "O bold", 24, true);
                case "p":
                    animation.addByPrefix("text", "P bold", 24, true);
                case "q":
                    animation.addByPrefix("text", "Q bold", 24, true);
                case "r":
                    animation.addByPrefix("text", "R bold", 24, true);
                case "s":
                    animation.addByPrefix("text", "S bold", 24, true);
                case "t":
                    animation.addByPrefix("text", "T bold", 24, true);
                case "u":
                    animation.addByPrefix("text", "U bold", 24, true);
                case "v":
                    animation.addByPrefix("text", "V bold", 24, true);
                case "w":
                    animation.addByPrefix("text", "W bold", 24, true);
                case "x":
                    animation.addByPrefix("text", "X bold", 24, true);
                case "y":
                    animation.addByPrefix("text", "Y bold", 24, true);
                case "z":
                    animation.addByPrefix("text", "Z bold", 24, true);
                case "0":
                    animation.addByPrefix("text", "bold0", 24, true);
                case "1":
                    animation.addByPrefix("text", "bold1", 24, true);
                case "2":
                    animation.addByPrefix("text", "bold2", 24, true);
                case "3":
                    animation.addByPrefix("text", "bold3", 24, true);
                case "4":
                    animation.addByPrefix("text", "bold4", 24, true);
                case "5":
                    animation.addByPrefix("text", "bold5", 24, true);
                case "6":
                    animation.addByPrefix("text", "bold6", 24, true);
                case "7":
                    animation.addByPrefix("text", "bold7", 24, true);
                case "8":
                    animation.addByPrefix("text", "bold8", 24, true);
                case "9":
                    animation.addByPrefix("text", "bold9", 24, true);
            }
        }

        animation.play("text");
        antialiasing = Config.antialiasing;
    }

    public function calculatePosition(collumn:Int, totalCollumns:Int, row:Int, totalRows:Int) //TODO
    {
        screenCenter();
        var col:Int = collumn * 50;
        var totalCol:Int = totalCollumns * 50;
        var rohw:Int = row * 100;
        var totalRohw:Int = totalRows * 100;

        x += col - (totalCol / 2);
        y += rohw - (totalRohw / 2);
    }
}