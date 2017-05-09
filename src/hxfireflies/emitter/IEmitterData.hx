package hxfireflies.emitter;

import hxfireflies.area.IArea;
import hxfireflies.particle.IParticle;

interface IEmitterData {
	public var area(default, set):IArea;

	public function setup(particle:IParticle):IParticle;
}
