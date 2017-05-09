package test.dl;

import test.dl.DLParticleView;
import hxfireflies.particle.Particle;
import hxfireflies.particle.IParticle;

class DLParticle extends Particle {
	public function new(view:DLParticleView) {
		super(view);
	}

	override public function dispose() {
		super.dispose();
	}

	override public function update(dt:Float) {
		super.update(dt);

		var v:DLParticleView = cast _view;
		v.shape.scaleX = (lifetime - time) / lifetime;
		v.shape.scaleY = (lifetime - time) / lifetime;
	}

	override public function clone():IParticle {
		return new DLParticle(cast _view.clone());
	}
}
