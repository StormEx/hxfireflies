package test;

import hxfireflies.pool.Pool;
import hxfireflies.particle.IParticle;
import hxfireflies.forces.IForce;
import hxfireflies.particle.IParticleView;
import hxfireflies.emitter.Emitter;

class DLEmitter extends Emitter {
	public function new(view:IParticleView) {
		super(view);
	}

	override public function clone():IParticle {
		trace("emitter clone");
		var res:DLEmitter = new DLEmitter(_view.clone());
//		var p:Pool = cast res.pool;
//		var f:Pool = cast pool;
//		p.prototype = f.prototype;
		res.pool = pool.clone();
		res.data = data;
		res.spawnInterval = spawnInterval;
		res.spawnCount = spawnCount;

		return res;
	}
}
