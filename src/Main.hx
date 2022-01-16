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

        #if LOGIN_ALLOWED
        addChild(new FlxGame(Lib.current.stage.stageWidth, Lib.current.stage.stageHeight, SignInState, 1, 60, 60, true, false));
        #else
        addChild(new FlxGame(Lib.current.stage.stageWidth, Lib.current.stage.stageHeight, TitleState, 1, 60, 60, true, false));
        #end

        addChild(new FPS(5, 5, 0xFFFFFF));
    }
}