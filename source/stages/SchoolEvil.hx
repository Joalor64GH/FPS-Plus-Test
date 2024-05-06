package stages;

import flixel.FlxSprite;
import flixel.math.FlxPoint;
import flixel.FlxObject;
import stages.elements.*;

class SchoolEvil extends BaseStage
{

    public override function init(){
        name = 'schoolEvil';
		uiType = "pixel";

		var posX = 400;
		var posY = 200;

		var bg:FlxSprite = new FlxSprite(posX, posY);
		bg.frames = Paths.getSparrowAtlas("week6/weeb/animatedEvilSchool");
		bg.animation.addByPrefix('idle', 'background 2', 24);
		bg.animation.play('idle');
		bg.scrollFactor.set(0.8, 0.9);
		bg.scale.set(6, 6);
		addToBackground(bg);

		// trailArea.scrollFactor.set();

		var evilTrail = new DeltaTrail(dad(), null, 10, 3 / 60, 0.4);
		//var evilTrail = new DeltaTrail(dad, null, 10, 24 / 60, 0.4, 0.005); //This is basically the default look of Spirit in base game.
		addToMiddle(evilTrail);

		dadStart.set(230, 924);
		bfStart.set(1006.5, 925.5);
		gfStart.set(640, 801);
    }
}