package test.dl;

import hxfireflies.particle.IParticleView;
import flash.events.Event;
import flash.Lib;

class DLMain extends BaseMain {
	public function new() {
		super();
	}

	function onFrame(e:Event) {
		gameLoop();
	}

	override function createParticleView(size:Float = 20):IParticleView {
		return new DLParticleView(size);
	}

	override function getTime():Float {
		return Lib.getTimer();
	}

	override function initialize() {
		Lib.current.stage.addEventListener(Event.ENTER_FRAME, onFrame);
	}
}
