package;

import flixel.FlxState;

class PlayState extends FlxState
{
    public var song:String = "null";

    public var player1:String = "bf";
    public var player2:String = "dad";
    public var gf:String = "gf";

    public var boyfriend:Character;
    public var girlfriend:Character;
    public var dad:Character;

    public var stage:String = "stage";

    public function new(lSong:String, ?p1:String = "bf", ?p2:String = "dad", ?p3:String = "gf", ?bg:String = "stage")
    {
        super();

        song = lSong;
        player1 = p1;
        player2 = p2;
        gf = p3;
        stage = bg;
    }

    override function create()
    {
        super.create();

        boyfriend = new Character(player1);
        boyfriend.screenCenter();
        add(boyfriend);

        dad = new Character(player2);
        dad.screenCenter();
        add(dad);

        girlfriend = new Character(gf);
        girlfriend.screenCenter();
        add(girlfriend);
    }
}