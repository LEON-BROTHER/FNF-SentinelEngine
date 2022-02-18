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
    tempo:String
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

    public static function saveChartConfig(song:String, file:ChartConfig)
    {
        var jsonData:String = Json.stringify(file);

        #if sys
        File.saveContent(Files.file(song + "/config", "json", "data", "preload"), jsonData);
        #end
    }
}