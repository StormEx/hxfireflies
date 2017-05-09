package test.js;

import hxfireflies.particle.IParticle;
import hxfireflies.particle.Particle;

class JsParticle extends Particle {
	public function new(view:JsParticleView) {
		super(view);
	}

	override public function dispose() {
		super.dispose();
	}

	override public function update(dt:Float) {
		super.update(dt);

		var v:JsParticleView = cast _view;
		v.scale = (lifetime - time) / lifetime;
//		v.shape.scaleX = (lifetime - time) / lifetime;
//		v.shape.scaleY = (lifetime - time) / lifetime;
	}

	override public function clone():IParticle {
		return new JsParticle(cast _view.clone());
	}
}
