package states.stages;

import states.stages.objects.*;
import objects.Note;

class Bike extends BaseStage
{
	public var bg:BGSprite;
	public var started:Bool = false;

	override function create()
	{
		bg = new BGSprite('bike/bg', -250, 250, 1, 1);
		bg.scale.set(1.75, 1.75);
		bg.alpha = 0;
		add(bg);
	}

	override function update(elapsed:Float)
	{
		if (bg.alpha > 0.1) {
			bg.alpha -= 0.0075;
		}
		if (bg.scale.x > 1.75 && bg.scale.y > 1.75) {
			bg.scale.set(bg.scale.x - 0.003, bg.scale.y - 0.003);
		}
	}

	override function beatHit()
		{
			bg.scale.set(1.85, 1.85);
		}
	
		// Note Hit/Miss
		override function goodNoteHit(note:Note)
		{
			FlxTween.tween(bg, { alpha: 1 }, 0.02);
		}
	
	override function countdownTick(count:Countdown, num:Int)
	{
		switch(count)
		{
			case THREE: //num 0
			case TWO: //num 1
			case ONE: //num 2
			case GO: //num 3
			case START: started = true;
		}
	}
}