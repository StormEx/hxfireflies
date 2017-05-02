package dl;

import hxfireflies.particle.IParticle;
import hxfireflies.emitter.IEmitter;
import hxfireflies.pool.Pool;
import flash.events.Event;
import flash.Lib;

class DLMain {
	var time:Int = 0;
	var _emitter:IParticle;

	public function new() {
//		var p:DLParticle = new DLParticle();
//		var pool:Pool = new Pool();
//		pool.prototype = p;

		time = Lib.getTimer();
		_emitter = new DLParticle();
		Lib.current.stage.addEventListener(Event.ENTER_FRAME, onFrame);
	}

	function onFrame(e:Event) {
		var cur:Int = Lib.getTimer();
		var dt:Int = cur - time;
		var val:Float = Math.sin(((2 * Math.PI) / 5000) * dt);
		var v:Float = (cur % 5000) / 5000;
		val = Math.sin(v * 2 * Math.PI);
		_emitter.y = 240 + val * 200;
		val = Math.cos(v * 2 * Math.PI);
		_emitter.x = 400 + val * 200;
		_emitter.update(dt);
		time = cur;
	}
}
