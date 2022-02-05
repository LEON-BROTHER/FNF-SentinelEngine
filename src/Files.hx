package;

import lime.app.Future;
import openfl.display.Bitmap;
import openfl.utils.Assets;
import openfl.display.BitmapData;

import flixel.graphics.frames.FlxAtlasFrames;

#if MODS_ALLOWED
import sys.io.FileInput;
import sys.io.File;
import sys.FileSystem;
#else
import openfl.utils.Assets;
#end

using StringTools;

class Files
{
    #if MODS_ALLOWED
    private static function getMods(file:String, extension:String, directory:String, ?library:String = null):Array<String>
    {
        var array:Array<String> = FileSystem.readDirectory("mods");

        var output:Array<String> = new Array<String>();

        for (i in 0...array.length)
        {
            if (library == "preload")
            {
                if (FileSystem.exists("mods/" + array[i] + "/" + directory + "/" + file + "." + extension))
                {
                    output.insert(array.length + 1, array[i] + "/" + directory + "/" + file + "." + extension);
                }
            }
            else
            {
                if (FileSystem.exists("mods/" + array[i] + "/" + library + "/" + directory + "/" + file + "." + extension))
                {
                    output.insert(array.length + 1, array[i] + "/" + library + "/" + directory + "/" + file + "." + extension);
                }
            }
        }

        return output;
    }
    #end

    private static function getLibrary(file:String, extension:String, directory:String):String
    {
        return "shared"; //TODO
    }

    private static function getPath(file:String, extension:String, directory:String, ?library:String = null):Dynamic
    {
        if (library == null)
        {
            library = getLibrary(file, extension, directory);
        }

        var output:String = null;
        if (library == "preload")
        {
            output = "assets/" + directory + "/" + file + "." + extension;
        }
        else
        {
            output = "assets/" + library + "/" + directory + "/" + file + "." + extension;
        }

        #if MODS_ALLOWED
        var mods:Array<String> = getMods(file, extension, directory, library);

        if (!FileSystem.exists(output) && mods.length < 1)
        #else
        if(!Assets.exists(output))
        #end
        {
            trace(output + " Is Invalid For Some F-ing Reason");
            switch (extension)
            {
                case "png":
                    output = "assets/MissingTexture.png";
                case "ogg" | "mp3":
                    output = "assets/MissingSound." + extension;
                default:
                    output = null;
            }
        }
        #if MODS_ALLOWED
        else if (FileSystem.exists("mods/" + mods[0]))
        {
            output = null;

            switch(extension)
            {
                case "png":
                    var read:FileInput = File.read("mods/" + mods[0]);
                    var data:Future<BitmapData> = BitmapData.loadFromBytes(read.readAll());
                    //var bm:Bitmap = new Bitmap(data); //IDK
                    return data;
                default:
                    var read:FileInput = File.read("mods/" + mods[0]);
                    return read.readAll();
            }
        }
        #end

        return output;
    }

    inline static public function file(file:String, extension:String, directory:String, ?library:String = null):Dynamic
    {
        return getPath(file, extension, directory, library);
    }

    inline static public function txt(file:String, directory:String, ?library:String = null):Dynamic
    {
        return getPath(file, "txt", directory, library);
    }

    inline static public function image(file:String, ?library:String = null):Dynamic
    {
        return getPath(file, "png", "images", library);
    }

    inline static public function sound(file:String, ?library:String = null):Dynamic
    {
        #if web
        return getPath(file, "mp3", "sounds", library);
        #else
        return getPath(file, "ogg", "sounds", library);
        #end
    }

    inline static public function music(file:String, ?library:String = null):Dynamic
    {
        #if web
        return getPath(file, "mp3", "music", library);
        #else
        return getPath(file, "ogg", "music", library);
        #end
    }

    inline static public function inst(songName:String):Dynamic
    {
        #if web
        return getPath("Inst", "mp3", songName.toLowerCase().replace(" ", "-"), "songs");
        #else
        return getPath("Inst", "ogg", songName.toLowerCase().replace(" ", "-"), "songs");
        #end
    }

    inline static public function voices(songName:String):Dynamic
    {
        #if web
        return getPath("Voices", "mp3", songName.toLowerCase().replace(" ", "-"), "songs");
        #else
        return getPath("Voices", "ogg", songName.toLowerCase().replace(" ", "-"), "songs");
        #end
    }

    inline static public function font(file:String):Dynamic
    {
        return "assets/fonts/" + file;
    }

    inline static public function getSparrowAtlas(fileName:String, ?library:String = null):FlxAtlasFrames
    {
        return FlxAtlasFrames.fromSparrow(image(fileName, library), file(fileName, "xml", "images", library));
    }

    inline static public function readTextFile(file:String):Array<String>
    {
        var textFile:Array<String> = [];
		#if MODS_ALLOWED
		if(FileSystem.exists(file)) textFile = File.getContent(file).trim().split('\n');
		#else
		if(Assets.exists(file)) textFile = Assets.getText(file).trim().split('\n');
		#end

		for (i in 0...textFile.length)
		{
			textFile[i] = textFile[i].trim();
		}

        return textFile;
    }
}