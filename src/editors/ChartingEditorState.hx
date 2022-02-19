package editors;

import flixel.system.FlxSound;
import flixel.FlxCamera.FlxCameraFollowStyle;
import flixel.FlxG;
import flixel.util.FlxColor;
import flixel.FlxSprite;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.addons.display.FlxGridOverlay;

import CustomFiles.ChartConfig;
import CustomFiles.Chart;

class ChartingEditorState extends FunkinState
{
    public var config:ChartConfig;
    public var chart:Chart;

    public var gridBG:FlxTypedGroup<FlxSprite>;

    public var dad:HealthIcon;
    public var bf:HealthIcon;

    public var scroll:Int;

    public var chartLength:Int;

    public function new()
    {
        super();

        config = CustomFiles.newChartConfig();
        chart = CustomFiles.newChart();
    }

    override function create()
    {
        super.create();

        FlxG.camera.follow(new FlxSprite((FlxG.width / 2) - FlxG.width, (FlxG.height / 2) - FlxG.height).makeGraphic(1, 1, FlxColor.TRANSPARENT, true, "targettedlol"), FlxCameraFollowStyle.NO_DEAD_ZONE, 1);

        gridBG = new FlxTypedGroup<FlxSprite>();
        add(gridBG);

        reloadPage();
        scroll = 0;
    }

    override function update(elapsed:Float)
    {
        super.update(elapsed);

        if (FlxG.keys.justPressed.ENTER)
        {
            FunkinState.switchState(new PlayState(config.song, config.player1, config.player2, config.gf, config.stage, "normal", []));
        }

        scroll += FlxG.mouse.wheel;

        if (scroll < 0)
        {
            scroll = length * 640;
        }
        else if (scroll > (length * 640))
        {
            scroll = 0;
        }

        for (i in 0...gridBG.members.length)
        {
            gridBG.members[i].y = 40 + (640 * i) - scroll;
        }
    }

    public function reloadPage()
    {
        gridBG = new FlxTypedGroup<FlxSprite>();
        chartLength = Std.int(FlxG.sound.load(Files.inst(config.song)).length + 1);
        trace(chartLength);

        for (i in 0...chartLength)
        {
            var grid:FlxSprite = FlxGridOverlay.create(40, 40 + (640 * i), 320, 640);
		    gridBG.add(grid);
            trace(gridBG.length);
        }

		dad = new HealthIcon("bf");
        dad.setGraphicSize(0, 45);
        dad.setPosition(0, -100);
        add(dad);

		bf = new HealthIcon('dad');
        bf.setGraphicSize(0, 45);
        bf.setPosition(gridBG.members[0].width / 2, -100);
        add(bf);
    }
}