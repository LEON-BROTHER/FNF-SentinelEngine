package;

import flixel.util.FlxTimer;
import flixel.FlxG;
import flixel.FlxState;
import flixel.addons.ui.FlxUIState;

class FunkinState extends FlxUIState
{
    public function new()
    {
        super();
    }

    override function create()
    {
        super.create();

        FlxG.state.openSubState(new CustomSexyTransition(true));

        new FlxTimer().start(0.7, function(tmr:FlxTimer) {
            FlxG.state.closeSubState();
        });
    }

    public static function switchState(nextState:FlxState)
    {
        FlxG.state.openSubState(new CustomSexyTransition(false));

        new FlxTimer().start(0.7, function(tmr:FlxTimer) {
            FlxG.switchState(nextState);
        });
    }
}