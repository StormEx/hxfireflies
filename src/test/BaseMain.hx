package test;

import hxfireflies.particle.IParticleView;
import hxfireflies.forces.ForceGravity;
import hxfireflies.forces.ForceCollection;
import hxfireflies.animators.AnimatorLinear;
import hxfireflies.animators.AnimatorOut;
import hxfireflies.animators.AnimatorIn;
import hxfireflies.particle.Particle;
import hxfireflies.emitter.EmitterData;
import hxfireflies.emitter.IEmitterData;
import hxfireflies.particle.IParticle;
import hxfireflies.pool.Pool;
import hxfireflies.pool.IPool;
import hxfireflies.area.ArcArea;
import hxfireflies.area.RingArea;
import hxfireflies.area.CircleArea;
import hxfireflies.emitter.IEmitter;

class BaseMain {
	var time:Float = 0;
	var _emitter:IEmitter;
	var _rEmitter:IEmitter;
	var _force:ForceCollection;

	public function new() {
		_force = new ForceCollection();
		_force.add(new ForceGravity(2));

		var p:Pool;
		time = getTime();
		_emitter = new DLEmitter(createParticleView());
		_emitter.pool = createPool();
		_emitter.data = createEmitterData();
		_emitter.data.area = new CircleArea(14);
		_rEmitter = new DLEmitter(createParticleView());
		_rEmitter.pool = createPool();
		_rEmitter.data = createEmitterData();
		_rEmitter.data.area = new RingArea(50, 50);
		_rEmitter.data.area = new ArcArea(150, 0, 0);
		initialize();
	}

	function createEmitterData():IEmitterData {
		var data:EmitterData = new EmitterData();
		data.lifetime = 500;
		data.lifetimeDelta = 1500;
		data.scaleSimple = false;
		data.scaleFrom = 0.5;
		data.scaleFromDelta = 1;
		data.scaleYFrom = 0.5;
		data.scaleYFromDelta = 1;
		data.scaleYTo = 0;
		data.scaleTo = 0;
		data.scaleAnimator = new AnimatorIn();
		data.scaleAnimator = new AnimatorOut();
		data.scaleAnimator = new AnimatorLinear();
		data.scaleYAnimator = new AnimatorLinear();
//		data.scaleAnimator = null;

//		data.spinFrom = -180;
//		data.spinFromDelta = -30;
//		data.spinTo = -1600;
//		data.spinToDelta = -60;
//		data.spinAnimator = new AnimatorLinear();

		data.angleFrom = 0;
		data.angleFromDelta = 0;
		data.angleTo = 1600;
		data.angleToDelta = 600;
		data.angleAnimator = new AnimatorLinear();

		data.alphaFrom = 1;
		data.alphaFromDelta = 0;
		data.alphaTo = 0;
		data.alphaToDelta = 0;
		data.alphaAnimator = new AnimatorLinear();

		data.velocityFrom = 30;
		data.velocityFromDelta = 20;
		data.velocityTo = 70;
		data.velocityToDelta = 40;
		data.velocityAnimator = new AnimatorOut();

		return data;
	}

	function createPool():IPool {
		var p:Pool = new Pool();
		p.prototype = new Particle(createParticleView(12));

		return p;
	}

	function gameLoop() {
		var cur:Float = getTime();
		var dt:Int = Std.int(cur - time);
		var val:Float = Math.sin(((2 * Math.PI) / 5000) * dt);
		var v:Float = (cur % 5000) / 5000;
		val = Math.sin(v * 2 * Math.PI);
		_emitter.y = 240 + val * 200;
		val = Math.cos(v * 2 * Math.PI);
		_emitter.x = 400 + val * 200;
//		heart(v, _emitter);
		_emitter.update(dt, null);

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
		_rEmitter.update(dt, _force);
		_force.enable = a.angleFrom >= 0 && a.angleFrom <= 180;
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

	function createParticleView(size:Float = 20):IParticleView {
		return null;
	}

	function getTime():Float {
		return 0;
	}

	function initialize() {
	}
}
