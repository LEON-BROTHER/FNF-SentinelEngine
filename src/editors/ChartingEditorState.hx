package editors;

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

    public function new()
    {
        super();

        config = CustomFiles.newChartConfig();
        chart = CustomFiles.newChart();
    }

    override function create()
    {
        super.create();

		var gridBG:FlxSprite = FlxGridOverlay.create(40, 40, 320, 640);
		add(gridBG);

		dad = new HealthIcon("bf");
        dad.setGraphicSize(0, 45);
        dad.setPosition(0, -100);
        add(dad);

		bf = new HealthIcon('dad');
        bf.setGraphicSize(0, 45);
        bf.setPosition(gridBG.width / 2, -100);
        add(bf);
    }
}