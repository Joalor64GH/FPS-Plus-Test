package characters;

class SenpaiAngry extends CharacterInfoBase
{

    override public function new(){

        super();

        info.name = "senpai-angry";
        info.spritePath = "week6/senpai";
        info.frameLoadType = sparrow;
        
        info.iconName = "senpai-angry";
        info.antialiasing = false;

        addByPrefix('idle', offset(), 'Angry Senpai Idle', 24, loop(false));
		addByPrefix('singUP', offset(1, 6), 'Angry Senpai UP NOTE', 24, loop(false));
		addByPrefix('singLEFT', offset(4, 1), 'Angry Senpai LEFT NOTE', 24, loop(false));
		addByPrefix('singRIGHT', offset(), 'Angry Senpai RIGHT NOTE', 24, loop(false));
		addByPrefix('singDOWN', offset(1, 1), 'Angry Senpai DOWN NOTE', 24, loop(false));

		addExtraData("scale", PlayState.daPixelZoom);
        addExtraData("reposition", [0, 102]);

         /*
        addByPrefix("idle", offset(-312, -410), "Angry Senpai Idle", 24, false, false, false);
        addByPrefix("singUP", offset(-312, -374), "Angry Senpai UP NOTE", 24, false, false, false);
        addByPrefix("singLEFT", offset(-288, -404), "Angry Senpai LEFT NOTE", 24, false, false, false);
        addByPrefix("singRIGHT", offset(-312, -410), "Angry Senpai RIGHT NOTE", 24, false, false, false);
        addByPrefix("singDOWN", offset(-306, -404), "Angry Senpai DOWN NOTE", 24, false, false, false);
        */

    }

}