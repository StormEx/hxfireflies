package test.dl;

import hxfireflies.emitter.IEmitterData;
import hxfireflies.particle.IParticle;
import hxfireflies.pool.Pool;
import hxfireflies.pool.IPool;
import hxfireflies.area.ArcArea;
import hxfireflies.area.RingArea;
import hxfireflies.area.CircleArea;
import hxfireflies.emitter.IEmitter;
import flash.events.Event;
import flash.Lib;

class DLMain {
	var time:Int = 0;
	var _emitter:IEmitter;
	var _rEmitter:IEmitter;

	public function new() {
		var p:Pool;
		time = Lib.getTimer();
		_emitter = new DLEmitter(new DLParticleView());
		_emitter.pool = createPool();
		_emitter.data = createEmitterData();
		_emitter.data.area = new CircleArea(14);
		_rEmitter = new DLEmitter(new DLParticleView());
		_rEmitter.pool = createPool();
		_rEmitter.data = createEmitterData();
		_rEmitter.data.area = new RingArea(50, 50);
		_rEmitter.data.area = new ArcArea(150, 0, 0);
		Lib.current.stage.addEventListener(Event.ENTER_FRAME, onFrame);
	}

	function createEmitterData():IEmitterData {
		return new DLEmitterData();
	}

	function createPool():IPool {
		var p:IPool = new Pool();
		p.prototype = new DLParticle(new DLParticleView(12));

		return p;
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
//		heart(v, _emitter);
		_emitter.update(dt);

		v = (cur % 3000) / 3000;
		_rEmitter.y = 240;
		_rEmitter.x = 400;
		var r:RingArea = Std.instance(_rEmitter.data.area, RingArea);
		if(r != null) {
			r.minRadius = r.maxRadius = 50 + v * 80;
		}
		var a:ArcArea = Std.instance(_rEmitter.data.area, ArcArea);
		if(a != null) {
			a.angleFrom = a.angleTo = v * 360;
		}
		_rEmitter.update(dt);
		time = cur;
	}

	function heart(v:Float, p:IParticle) {
		if(v >= 0 && v < 0.25) {
			v = v / 0.25;
			p.y = 240 - 100 * Math.sin(v * Math.PI);
			p.x = 400 - 200 * (1 - v);
		}
		else if(v >= 0.25 && v < 0.5) {
			v = (v - 0.25) / 0.25;
			p.y = 240 - 100 * Math.sin(v * Math.PI);
			p.x = 400 + 200 * v;
		}
		else if(v >= 0.5 && v < 0.75) {
			v = (v - 0.5) / 0.25;
			p.y = 240 + 200 * Math.sin(v * Math.PI * 0.5);
			p.x = 400 + 200 * (1 - v);
		}
		else if(v >= 0.75 && v < 1) {
			v = (v - 0.75) / 0.25;
			p.y = 240 + 200 * Math.sin(0.5 * Math.PI + v * Math.PI * 0.5);
			p.x = 400 - 200 * v;
		}
		else
		{
			p.y = 240;
			p.x = 400;
		}
	}
}
