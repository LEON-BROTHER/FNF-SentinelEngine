package;

#if !js
import sys.FileSystem;
#end

class Files
{
    private static function getLibrary(file:String, extension:String, directory:String):String
    {
        return "shared"; //TODO
    }

    private static function getPath(file:String, extension:String, directory:String, ?library:String = null):String
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
            output = library + ":assets/" + library + "/" + directory + "/" + file + "." + extension;
        }

        #if !js
        if (!FileSystem.exists(output))
        {
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
        #end

        return output;
    }

    inline static public function file(file:String, extension:String, directory:String, ?library:String = null):String
    {
        return getPath(file, extension, directory, library);
    }

    inline static public function txt(file:String, directory:String, ?library:String = null):String
    {
        return getPath(file, "txt", directory, library);
    }

    inline static public function image(file:String, ?library:String = null):String
    {
        return getPath(file, "png", "images", library);
    }

    inline static public function sound(file:String, ?library:String = null):String
    {
        #if web
        return getPath(file, "mp3", "sounds", library);
        #else
        return getPath(file, "ogg", "sounds", library);
        #end
    }

    inline static public function music(file:String, ?library:String = null):String
    {
        #if web
        return getPath(file, "mp3", "music", library);
        #else
        return getPath(file, "ogg", "music", library);
        #end
    }

    inline static public function inst(songName:String):String
    {
        #if web
        return getPath("Inst", "mp3", songName, "songs");
        #else
        return getPath("Inst", "ogg", songName, "songs");
        #end
    }

    inline static public function voices(songName:String):String
    {
        #if web
        return getPath("Voices", "mp3", songName, "songs");
        #else
        return getPath("Voices", "ogg", songName, "songs");
        #end
    }

    inline static public function font(file:String):String
    {
        return "assets/fonts/" + file;
    }
}