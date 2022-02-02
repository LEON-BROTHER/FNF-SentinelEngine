package;

import flixel.FlxSprite;

class Character extends FlxSprite
{
    public var facingRight:Bool;

    public function new(character:String)
    {
        super();

        antialiasing = Config.antialiasing;

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

                facingRight = true;
            case "bf-pixel-ded":
                frames = Files.getSparrowAtlas("characters/bfPixelsDEAD", "shared");
                animation.addByPrefix("death", "BF dies", 24, false);
                animation.addByPrefix("deathLoop", "BF Dead Loop", 24, true);
                animation.addByPrefix("deathConfirm", "BF Dead confirm", 24, false);

                facingRight = true;
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
            case "gf-car":
                frames = Files.getSparrowAtlas("characters/gfCar", "shared");
                animation.addByPrefix("idle", "GF Dancing Beat Hair blowing CAR", 24, true);

                facingRight = false;
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
            case "gf-pixel":
                frames = Files.getSparrowAtlas("characters/gfPixel", "shared");
                animation.addByPrefix("idle", "GF IDLE", 24, true);

                facingRight = false;
            case "dad":
                frames = Files.getSparrowAtlas("characters/DADDY_DEAREST", "shared");
                animation.addByPrefix("idle", "Dad idle dance", 24, true);

                animation.addByPrefix("left", "Dad Sing Note LEFT", 24, false);
                animation.addByPrefix("right", "Dad Sing Note RIGHT", 24, false);
                animation.addByPrefix("up", "Dad Sing Note UP", 24, false);
                animation.addByPrefix("down", "Dad Sing Note DOWN", 24, false);

                facingRight = false;
            case "spooky-kids":
                frames = Files.getSparrowAtlas("characters/spooky_kids_assets", "shared");
                animation.addByPrefix("idle", "spooky dance idle", 24, true);

                animation.addByPrefix("left", "note sing left", 24, false);
                animation.addByPrefix("right", "spooky sing right", 24, false);
                animation.addByPrefix("up", "spooky UP NOTE", 24, false);
                animation.addByPrefix("down", "spooky DOWN note", 24, false);

                facingRight = false;
            case "monster":
                frames = Files.getSparrowAtlas("characters/Monster_Assets", "shared");
                animation.addByPrefix("idle", "monster idle", 24, true);

                animation.addByPrefix("left", "Monster left note", 24, false);
                animation.addByPrefix("right", "Monster Right note", 24, false);
                animation.addByPrefix("up", "monster up note", 24, false);
                animation.addByPrefix("down", "monster down", 24, false);

                facingRight = false;
            case "monster-christmas":
                frames = Files.getSparrowAtlas("characters/monsterChristmas", "shared");
                animation.addByPrefix("idle", "monster idle", 24, true);

                animation.addByPrefix("left", "Monster left note", 24, false);
                animation.addByPrefix("right", "Monster Right note", 24, false);
                animation.addByPrefix("up", "monster up note", 24, false);
                animation.addByPrefix("down", "monster down", 24, false);

                facingRight = false;
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
        }

        idle();
    }

    public function idle()
    {
        animation.play("idle");
    }

    public function left()
    {
        animation.play("left");
    }

    public function right()
    {
        animation.play("right");
    }

    public function up()
    {
        animation.play("up");
    }

    public function down()
    {
        animation.play("down");
    }
}