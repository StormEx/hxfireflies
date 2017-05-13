package test;

import hxfireflies.forces.IForce;
import hxfireflies.particle.IParticleView;
import hxfireflies.emitter.Emitter;

class DLEmitter extends Emitter {
	public function new(view:IParticleView) {
		super(view);
	}

	override public function update(dt:Float, force:IForce = null) {
		super.update(dt, force);

		if(_time > 50) {
			_time = 0;
			pool.alloc(1, data);
		}
	}
}