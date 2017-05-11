package hxfireflies.emitter;

import hxfireflies.pool.IPool;
import hxfireflies.particle.IParticle;

interface IEmitter extends IParticle {
	public var data(default, set):IEmitterData;
	public var pool(default, set):IPool;

	public function emit(count:Int):Void;
}
