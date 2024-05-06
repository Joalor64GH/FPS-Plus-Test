package stages;

import flixel.util.FlxTimer;
import flixel.FlxG;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.FlxSprite;
import flixel.math.FlxPoint;
import flixel.FlxObject;
import stages.elements.*;

class Limo extends BaseStage
{

	var limo:FlxSprite;
	var grpLimoDancers:FlxTypedGroup<BackgroundDancer>;
	var fastCar:FlxSprite;

	var fastCarCanDrive:Bool = true;

    public override function init(){
        name = 'limo';
		startingZoom = 0.90;

		var skyBG:FlxSprite = new FlxSprite(-120, -50).loadGraphic(Paths.image("week4/limo/limoSunset"));
		skyBG.scrollFactor.set(0.1, 0.1);
		skyBG.antialiasing = true;
		addToBackground(skyBG);

		var bgLimo:FlxSprite = new FlxSprite(-200, 480);
		bgLimo.frames = Paths.getSparrowAtlas("week4/limo/bgLimo");
		bgLimo.animation.addByPrefix('drive', "background limo pink", 24);
		bgLimo.animation.play('drive');
		bgLimo.scrollFactor.set(0.4, 0.4);
		bgLimo.antialiasing = true;
		addToBackground(bgLimo);

		grpLimoDancers = new FlxTypedGroup<BackgroundDancer>();
		addToBackground(grpLimoDancers);

		for (i in 0...5)
		{
			var dancer:BackgroundDancer = new BackgroundDancer((370 * i) + 130, bgLimo.y - 400);
			dancer.scrollFactor.set(0.4, 0.4);
			grpLimoDancers.add(dancer);
		}

		//overlayShit:FlxSprite = new FlxSprite(-500, -600).loadGraphic(Paths.images("limo/limoOverlay"));
		//overlayShit.alpha = 0.5;
		//add(overlayShit);

		// var shaderBullshit = new BlendModeEffect(new OverlayShader(), FlxColor.RED);

		// FlxG.camera.setFilters([new ShaderFilter(cast shaderBullshit.shader)]);

		// overlayShit.shader = shaderBullshit;

		fastCar = new FlxSprite(-300, 160).loadGraphic(Paths.image("week4/limo/fastCarLol"));
		fastCar.antialiasing = true;
		addToBackground(fastCar);

		limo = new FlxSprite(-120, 550);
		limo.frames = Paths.getSparrowAtlas("week4/limo/limoDrive");
		limo.animation.addByPrefix('drive', "Limo stage", 24);
		limo.animation.play('drive');
		limo.antialiasing = true;
		addToMiddle(limo);

		resetFastCar();

		dadStart.set(341, 914);
		bfStart.set(1235.5, 604);
		gfStart.set(787, 779);
    }

	public override function beat(curBeat:Float){
		grpLimoDancers.forEach(function(dancer:BackgroundDancer){
			dancer.dance();
		});

		if (FlxG.random.bool(10) && fastCarCanDrive)
			fastCarDrive();
	} 

	function resetFastCar():Void
	{
		fastCar.x = -12600;
		fastCar.y = FlxG.random.int(140, 250);
		fastCar.velocity.x = 0;
		fastCarCanDrive = true;
	}

	function fastCarDrive()
	{
		FlxG.sound.play(Paths.sound('carPass' + FlxG.random.int(0, 1)), 0.7);

		fastCar.velocity.x = (FlxG.random.int(170, 220) / FlxG.elapsed) * 3;
		fastCarCanDrive = false;
		new FlxTimer().start(2, function(tmr:FlxTimer)
		{
			resetFastCar();
		});
	}
}