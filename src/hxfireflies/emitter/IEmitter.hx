package hxfireflies.emitter;

import hxfireflies.particle.IParticle;

interface IEmitter extends IParticle {
	public var data(get, set):IEmitterData;
}
