package;

import flixel.util.FlxColor;
import flixel.FlxSprite;

class Character extends FlxSprite
{
    public var facingRight:Bool;
    public var pixel:Bool;

    public var barClr:FlxColor;

    public function new(character:String, player:Bool)
    {
        super();

        switch (character)
        {
            case "bf":
                frames = Files.getSparrowAtlas("characters/BOYFRIEND", "shared");
                animation.addByPrefix("idle", "BF idle dance", 24, true);

                animation.addByPrefix("left", "BF NOTE LEFT", 24, false);
                animation.addByPrefix("right", "BF NOTE RIGHT", 24, false);
                animation.addByPrefix("up", "BF NOTE UP", 24, false);
                animation.addByPrefix("down", "BF NOTE DOWN", 24, false);

                animation.addByPrefix("left-miss", "BF NOTE LEFT MISS", 24, false);
                animation.addByPrefix("right-miss", "BF NOTE RIGHT MISS", 24, false);
                animation.addByPrefix("up-miss", "BF NOTE UP MISS", 24, false);
                animation.addByPrefix("down-miss", "BF NOTE DOWN MISS", 24, false);

                animation.addByPrefix("death", "BF dies", 24, false);
                animation.addByPrefix("deathLoop", "BF Dead Loop", 24, true);
                animation.addByPrefix("deathConfirm", "BF Dead confirm", 24, false);

                animation.addByPrefix("cheer", "BF HEY!!", 24, false); //Week 1
                animation.addByPrefix("scared", "BF idle shaking", 24, false); //Week 2

                facingRight = true;
                pixel = false;
                barClr = 0xFF0000AA;
            case "bf-car":
                frames = Files.getSparrowAtlas("characters/bfCar", "shared");
                animation.addByPrefix("idle", "BF idle dance", 24, true);

                animation.addByPrefix("left", "BF NOTE LEFT", 24, false);
                animation.addByPrefix("right", "BF NOTE RIGHT", 24, false);
                animation.addByPrefix("up", "BF NOTE UP", 24, false);
                animation.addByPrefix("down", "BF NOTE DOWN", 24, false);

                animation.addByPrefix("left-miss", "BF NOTE LEFT MISS", 24, false);
                animation.addByPrefix("right-miss", "BF NOTE RIGHT MISS", 24, false);
                animation.addByPrefix("up-miss", "BF NOTE UP MISS", 24, false);
                animation.addByPrefix("down-miss", "BF NOTE DOWN MISS", 24, false);

                facingRight = true;
                pixel = false;
            case "bf-christmas":
                frames = Files.getSparrowAtlas("characters/bfChristmas", "shared");
                animation.addByPrefix("idle", "BF idle dance", 24, true);

                animation.addByPrefix("left", "BF NOTE LEFT", 24, false);
                animation.addByPrefix("right", "BF NOTE RIGHT", 24, false);
                animation.addByPrefix("up", "BF NOTE UP", 24, false);
                animation.addByPrefix("down", "BF NOTE DOWN", 24, false);

                animation.addByPrefix("left-miss", "BF NOTE LEFT MISS", 24, false);
                animation.addByPrefix("right-miss", "BF NOTE RIGHT MISS", 24, false);
                animation.addByPrefix("up-miss", "BF NOTE UP MISS", 24, false);
                animation.addByPrefix("down-miss", "BF NOTE DOWN MISS", 24, false);

                animation.addByPrefix("cheer", "BF HEY!!", 24, false); //Week 1

                facingRight = true;
                pixel = false;
            case "bf-pixel":
                frames = Files.getSparrowAtlas("characters/bfPixel", "shared");
                animation.addByPrefix("idle", "BF idle dance", 24, true);

                animation.addByPrefix("left", "BF NOTE LEFT", 24, false);
                animation.addByPrefix("right", "BF NOTE RIGHT", 24, false);
                animation.addByPrefix("up", "BF NOTE UP", 24, false);
                animation.addByPrefix("down", "BF NOTE DOWN", 24, false);

                animation.addByPrefix("left-miss", "BF NOTE LEFT MISS", 24, false);
                animation.addByPrefix("right-miss", "BF NOTE RIGHT MISS", 24, false);
                animation.addByPrefix("up-miss", "BF NOTE UP MISS", 24, false);
                animation.addByPrefix("down-miss", "BF NOTE DOWN MISS", 24, false);

                setGraphicSize(Std.int(width * 6), Std.int(height * 6));

                facingRight = true;
                pixel = true;
            case "bf-pixel-ded":
                frames = Files.getSparrowAtlas("characters/bfPixelsDEAD", "shared");
                animation.addByPrefix("death", "BF dies", 24, false);
                animation.addByPrefix("deathLoop", "BF Dead Loop", 24, true);
                animation.addByPrefix("deathConfirm", "BF Dead confirm", 24, false);

                setGraphicSize(Std.int(width * 6), Std.int(height * 6));

                facingRight = true;
                pixel = true;
            case "gf":
                frames = Files.getSparrowAtlas("characters/GF_assets", "shared");
                animation.addByPrefix("idle", "GF Dancing Beat", 24, true);
                animation.addByPrefix("idle-land", "GF Dancing Beat Hair Landing", 24, false); //Week 3 Possibly
                animation.addByPrefix("idle-blow", "GF Dancing Beat Hair blowing", 24, true); // Week 3 Possibly

                animation.addByPrefix("left", "GF left note", 24, false);
                animation.addByPrefix("right", "GF Right Note", 24, false);
                animation.addByPrefix("up", "GF Up Note", 24, false);
                animation.addByPrefix("down", "GF Down Note", 24, false);

                animation.addByPrefix("sad", "gf sad", 24, false);

                animation.addByPrefix("cheer", "GF Cheer", 24, false); //Week 1
                animation.addByPrefix("scared", "GF FEAR ", 24, false); //Week 2

                facingRight = false;
                pixel = false;
            case "gf-car":
                frames = Files.getSparrowAtlas("characters/gfCar", "shared");
                animation.addByPrefix("idle", "GF Dancing Beat Hair blowing CAR", 24, true);

                facingRight = false;
                pixel = false;
            case "gf-christmas":
                frames = Files.getSparrowAtlas("characters/gfChristmas", "shared");
                animation.addByPrefix("idle", "GF Dancing Beat", 24, true);
                animation.addByPrefix("idle-land", "GF Dancing Beat Hair Landing", 24, false); //Week 3 Possibly

                animation.addByPrefix("left", "GF left note", 24, false);
                animation.addByPrefix("right", "GF Right Note", 24, false);
                animation.addByPrefix("up", "GF Up Note", 24, false);
                animation.addByPrefix("down", "GF Down Note", 24, false);

                animation.addByPrefix("sad", "gf sad", 24, false);

                animation.addByPrefix("cheer", "GF Cheer", 24, false); //Week 1
                animation.addByPrefix("scared", "GF FEAR ", 24, false); //Week 2

                facingRight = false;
                pixel = false;
            case "gf-pixel":
                frames = Files.getSparrowAtlas("characters/gfPixel", "shared");
                animation.addByPrefix("idle", "GF IDLE", 24, true);

                setGraphicSize(Std.int(width * 6), Std.int(height * 6));

                facingRight = false;
                pixel = true;
            case "dad":
                frames = Files.getSparrowAtlas("characters/DADDY_DEAREST", "shared");
                animation.addByPrefix("idle", "Dad idle dance", 24, true);

                animation.addByPrefix("left", "Dad Sing Note LEFT", 24, false);
                animation.addByPrefix("right", "Dad Sing Note RIGHT", 24, false);
                animation.addByPrefix("up", "Dad Sing Note UP", 24, false);
                animation.addByPrefix("down", "Dad Sing Note DOWN", 24, false);

                facingRight = false;
                pixel = false;
            case "spooky-kids":
                frames = Files.getSparrowAtlas("characters/spooky_kids_assets", "shared");
                animation.addByPrefix("idle", "spooky dance idle", 24, true);

                animation.addByPrefix("left", "note sing left", 24, false);
                animation.addByPrefix("right", "spooky sing right", 24, false);
                animation.addByPrefix("up", "spooky UP NOTE", 24, false);
                animation.addByPrefix("down", "spooky DOWN note", 24, false);

                facingRight = false;
                pixel = false;
            case "monster":
                frames = Files.getSparrowAtlas("characters/Monster_Assets", "shared");
                animation.addByPrefix("idle", "monster idle", 24, true);

                animation.addByPrefix("left", "Monster left note", 24, false);
                animation.addByPrefix("right", "Monster Right note", 24, false);
                animation.addByPrefix("up", "monster up note", 24, false);
                animation.addByPrefix("down", "monster down", 24, false);

                facingRight = false;
                pixel = false;
            case "monster-christmas":
                frames = Files.getSparrowAtlas("characters/monsterChristmas", "shared");
                animation.addByPrefix("idle", "monster idle", 24, true);

                animation.addByPrefix("left", "Monster left note", 24, false);
                animation.addByPrefix("right", "Monster Right note", 24, false);
                animation.addByPrefix("up", "monster up note", 24, false);
                animation.addByPrefix("down", "monster down", 24, false);

                facingRight = false;
                pixel = false;
            case "pico":
                frames = Files.getSparrowAtlas("characters/Pico_FNF_assetss", "shared");
                animation.addByPrefix("idle", "Pico Idle Dance", 24, true);

                animation.addByPrefix("left", "Pico NOTE LEFT", 24, false);
                animation.addByPrefix("right", "Pico Note Right", 24, false);
                animation.addByPrefix("up", "pico Up note", 24, false);
                animation.addByPrefix("down", "Pico Down Note", 24, false);

                animation.addByPrefix("left-miss", "Pico NOTE LEFT miss", 24, false);
                animation.addByPrefix("right-miss", "Pico Note Right Miss", 24, false);
                animation.addByPrefix("up-miss", "pico Up note miss", 24, false);
                animation.addByPrefix("down-miss", "Pico Down Note MISS", 24, false);

                facingRight = true;
                pixel = false;
            case "mom":
                frames = Files.getSparrowAtlas("characters/Mom_Assets", "shared");
                animation.addByPrefix("idle", "Mom Idle", 24, true);

                animation.addByPrefix("left", "Mom Left Pose", 24, false);
                animation.addByPrefix("right", "Mom Pose Left", 24, false); //Look's Like Someone Fucked Up The Animation Naming Lol -Generalisk
                animation.addByPrefix("up", "Mom Up Pose", 24, false);
                animation.addByPrefix("down", "MOM DOWN POSE", 24, false);

                facingRight = false;
                pixel = false;
            case "mom-car":
                frames = Files.getSparrowAtlas("characters/momCar", "shared");
                animation.addByPrefix("idle", "Mom Idle", 24, true);

                animation.addByPrefix("left", "Mom Left Pose", 24, false);
                animation.addByPrefix("right", "Mom Pose Left", 24, false); //Look's Like Someone Fucked Up The Animation Naming Lol -Generalisk
                animation.addByPrefix("up", "Mom Up Pose", 24, false);
                animation.addByPrefix("down", "MOM DOWN POSE", 24, false);

                facingRight = false;
                pixel = false;
            case "parents":
                frames = Files.getSparrowAtlas("characters/mom_dad_christmas_assets", "shared");
                animation.addByPrefix("idle", "Parent Christmas Idle", 24, true);

                animation.addByPrefix("left", "Parent Left Note Dad", 24, false);
                animation.addByPrefix("right", "Parent Right Note Dad", 24, false);
                animation.addByPrefix("up", "Parent Up Note Dad", 24, false);
                animation.addByPrefix("down", "Parent Down Note Dad", 24, false);

                animation.addByPrefix("left-alt", "Parent Left Note Mom", 24, false);
                animation.addByPrefix("right-alt", "Parent Right Note Mom", 24, false);
                animation.addByPrefix("up-alt", "Parent Up Note Mom", 24, false);
                animation.addByPrefix("down-alt", "Parent Down Note Mom", 24, false);

                facingRight = false;
                pixel = false;
            case "senpai":
                frames = Files.getSparrowAtlas("characters/senpai", "shared");
                animation.addByPrefix("idle", "Senpai Idle instance 1", 24, true);

                animation.addByPrefix("left", "SENPAI LEFT NOTE instance 1", 24, false);
                animation.addByPrefix("right", "SENPAI RIGHT NOTE instance 1", 24, false);
                animation.addByPrefix("up", "SENPAI UP NOTE instance 1", 24, false);
                animation.addByPrefix("down", "SENPAI DOWN NOTE instance 1", 24, false);

                setGraphicSize(Std.int(width * 6), Std.int(height * 6));

                facingRight = false;
                pixel = true;
            case "senpai-mad":
                frames = Files.getSparrowAtlas("characters/senpai", "shared");
                animation.addByPrefix("idle", "Angry Senpai Idle instance 1", 24, true);

                animation.addByPrefix("left", "Angry Senpai LEFT NOTE instance 1", 24, false);
                animation.addByPrefix("right", "Angry Senpai RIGHT NOTE instance 1", 24, false);
                animation.addByPrefix("up", "Angry Senpai UP NOTE instance 10", 24, false);
                animation.addByPrefix("down", "Angry Senpai DOWN NOTE instance 1", 24, false);

                setGraphicSize(Std.int(width * 6), Std.int(height * 6));

                facingRight = false;
                pixel = true;
            case "spirit":
                frames = Files.getSparrowAtlas("characters/spirit", "shared");
                animation.addByPrefix("idle", "idle spirit_", 24, true);

                animation.addByPrefix("left", "left_", 24, false);
                animation.addByPrefix("right", "right_", 24, false);
                animation.addByPrefix("up", "up_", 24, false);
                animation.addByPrefix("down", "spirit down_", 24, false);

                setGraphicSize(Std.int(width * 6), Std.int(height * 6));

                facingRight = false;
                pixel = true;
        }

        if ((player && !facingRight) || (!player && facingRight))
        {
            flipX = true;
        }
        else
        {
            flipX = false;
        }

        if (pixel)
        {
            antialiasing = false;
        }
        else
        {
            antialiasing = Config.antialiasing;
        }

        idle();
    }

    public function idle()
    {
        animation.play("idle");
    }

    public function left(?alt:Bool = false)
    {
        var suffix:String = "";

        if (alt)
        {
            suffix = "-alt";
        }

        animation.play("left" + suffix);
    }

    public function right(?alt:Bool = false)
    {
        var suffix:String = "";

        if (alt)
        {
            suffix = "-alt";
        }

        animation.play("right" + suffix);
    }

    public function up(?alt:Bool = false)
    {
        var suffix:String = "";

        if (alt)
        {
            suffix = "-alt";
        }

        animation.play("up" + suffix);
    }

    public function down(?alt:Bool = false)
    {
        var suffix:String = "";

        if (alt)
        {
            suffix = "-alt";
        }

        animation.play("down" + suffix);
    }
}