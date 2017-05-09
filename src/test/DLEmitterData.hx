package test;

import hxfireflies.emitter.EmitterData;
import hxfireflies.particle.IParticle;

class DLEmitterData extends EmitterData {
	public function new() {
		super();
	}

	override public function setup(particle:IParticle):IParticle {
		particle.lifetime = 500 + Math.random() * 1500;

		return super.setup(particle);
	}
}
