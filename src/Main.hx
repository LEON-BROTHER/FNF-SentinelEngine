package;

import flixel.FlxGame;
import openfl.display.FPS;
import openfl.Lib;
import openfl.display.Sprite;

class Main extends Sprite
{
    public static function main():Void
    {
        Lib.current.addChild(new Main());
    }

    public function new()
    {
        super();

        addChild(new FlxGame(Lib.current.stage.stageWidth, Lib.current.stage.stageHeight, SignInState, 1, 60, 60, true, false));
        //addChild(new FPS(5, 5, 0xFFFFFF));
    }
}