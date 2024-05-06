package stages;

//import flixel.FlxBasic;
import flixel.math.FlxPoint;

/**
	This is the base class for stages. When making your own stage make a new class extending this one.    
	@author Rozebud
**/

class BaseStage
{

    public var name:String;
    public var startingZoom:Float = 1.05;
    public var uiType:String = "default";
    public var cameraMovementEnabled:Bool = true;
    public var extraCameraMovementAmount:Null<Float> = null; //Leave null for PlayState default.
    public var cameraStartPosition:FlxPoint; //Leave null for PlayState default.
    public var globalCameraOffset:FlxPoint = new FlxPoint();
    public var extraData:Map<String, Dynamic> = new Map<String, Dynamic>();
    public var events:Map<String, Void->Void> = new Map<String, Void->Void>();

    public var backgroundElements:Array<Dynamic> = [];
    public var middleElements:Array<Dynamic> = [];
    public var foregroundElements:Array<Dynamic> = [];

    public var useStartPoints:Bool = true; //Auto positions characters if set to true
    public var dadStart:FlxPoint = new FlxPoint(314.5, 867);
    public var bfStart:FlxPoint = new FlxPoint(975.5, 862);
    public var gfStart:FlxPoint = new FlxPoint(751.5, 778);

    /**
	 * Do not override this function, override `init()` instead.
	 */
    public function new(){
        init();
    }

    /**
	 * Override this function to initialize all of your stage elements.
	 */
    function init(){}

    /**
	 * Adds an object to `backgroundElements` to be added to PlayState.
	 *
	 * @param   x  The object to add. Should be any type that can be added to a state.
	 */
    public function addToBackground(x:Dynamic){
        backgroundElements.push(x);
    }

    /**
	 * Adds an object to `middleElements` to be added to PlayState.
	 *
	 * @param   x  The object to add. Should be any type that can be added to a state.
	 */
    public function addToMiddle(x:Dynamic){
        middleElements.push(x);
    }

    /**
	 * Adds an object to `foregroundElements` to be added to PlayState.
	 *
	 * @param   x  The object to add. Should be any type that can be added to a state.
	 */
    public function addToForeground(x:Dynamic){
        foregroundElements.push(x);
    }

    /**
	 * Adds arbitrary info to the stage that can be read in PlayState.
	 *
	 * @param   k  A string key.
	 * @param   x  The dyanmic data.
	 */
    public function addExtraData(k:String, x:Dynamic){
        extraData.set(k, x);
    }

    /**
     * Adds arbitrary info to the stage that can be read in PlayState.
     *
     * @param   name    The name of the event.
     * @param   func    The function that gets called when the event is triggered. Must have no arguments and no return type.
     */
    public function addEvent(name:String, func:Void->Void){
        events.set(name, func);
    }

    /**
	 * Destroys all objects added to the stage elements.
	 */
    public function destroyAll(){
        for(x in backgroundElements){ x.destroy(); }
        for(x in middleElements){ x.destroy(); }
        for(x in foregroundElements){ x.destroy(); }
    }

    /**
	 * Called every frame in PlayState update.
     *
     * @param   elpased  The elapsed time between previous frames passed in by PlayState.
	 */
    public function update(elapsed:Float){}

    /**
	 * Called every beat hit in PlayState.
     *
     * @param   curBeat  The current song beat passed in by PlayState.
	 */
    public function beat(curBeat:Int){}

    /**
	 * Called every step hit in PlayState.
     *
     * @param   curStep  The current song step passed in by PlayState.
	 */
    public function step(curStep:Int){}

    inline function boyfriend()     { return PlayState.instance.boyfriend; }
    inline function gf()            { return PlayState.instance.gf; }
    inline function dad()           { return PlayState.instance.dad; }
    inline function playstate()     { return PlayState.instance; }

}