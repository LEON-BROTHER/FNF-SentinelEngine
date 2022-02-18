package;

import haxe.Json;

#if sys
import sys.io.File;
import sys.FileSystem;
#else
import openfl.utils.Assets;
#end

typedef ChartConfig = 
{
    song:String,
    player1:String,
    player2:String,
    gf:String,
    stage:String,
    noteStyle:String,
    tempo:String
};

typedef Chart = 
{
    scrollSpeed:Float,
    sections:Array<Section>
};

typedef Section = 
{
    notes:Array<ChartNote>,
    events:Array<Event>
}

typedef ChartNote = 
{
    noteType:Int,
    position:Int,
    location:Int,
    length:Int
};

typedef Event = 
{
    location:Int,
    eventType:Int,
    value1:String
};

class CustomFiles
{
    public static function loadChartConfig(song:String):ChartConfig
    {
        var jsonData:String = "";

        #if sys
		if(FileSystem.exists(Files.file(song + "/config", "json", "data", "preload"))) jsonData = File.getContent(Files.file(song + "/config", "json", "data", "preload"));
		#else
		if(Assets.exists(Files.file(song + "/config", "json", "data", "preload"))) jsonData = Assets.getText(Files.file(song + "/config", "json", "data", "preload"));
		#end

        var output:ChartConfig = Json.parse(jsonData);

        return output;
    }

    public static function newChartConfig():ChartConfig
    {
        var output:ChartConfig = {
            song: "Tutorial",
            player1: "dad",
            player2: "bf",
            gf: "gf",
            stage: "stage",
            noteStyle: "default",
            tempo: "100"
        };

        return output;
    }

    public static function saveChartConfig(song:String, file:ChartConfig)
    {
        var jsonData:String = Json.stringify(file);

        #if sys
        File.saveContent(Files.file(song + "/config", "json", "data", "preload"), jsonData);
        #end
    }

    public static function loadChart(song:String, difficulty:String):Chart
    {
        var jsonData:String = "";

        var suffix:String = "";
        if (difficulty.toLowerCase() != "normal")
        {
            suffix = "-" + difficulty.toLowerCase();
        }

        #if sys
		if(FileSystem.exists(Files.file(song + "/" + song + suffix, "json", "data", "preload"))) jsonData = File.getContent(Files.file(song + "/" + song + suffix, "json", "data", "preload"));
		#else
		if(Assets.exists(Files.file(song + "/" + song + suffix, "json", "data", "preload"))) jsonData = Assets.getText(Files.file(song + "/" + song + suffix, "json", "data", "preload"));
		#end

        var output:Chart = Json.parse(jsonData);

        return output;
    }

    public static function newChart():Chart
    {
        var output:Chart = {
            scrollSpeed: 1,
            sections: []
        };

        return output;
    }

    public static function saveChart(song:String, difficulty:String, file:ChartConfig)
    {
        var jsonData:String = Json.stringify(file);

        var suffix:String = "";
        if (difficulty.toLowerCase() != "normal")
        {
            suffix = "-" + difficulty.toLowerCase();
        }

        #if sys
        File.saveContent(Files.file(song + "/" + song + suffix, "json", "data", "preload"), jsonData);
        #end
    }
}