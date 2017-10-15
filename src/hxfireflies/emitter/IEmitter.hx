package hxfireflies.emitter;

import hxfireflies.forces.IForce;
import hxfireflies.pool.IPool;
import hxfireflies.particle.IParticle;

interface IEmitter extends IParticle {
	public var spawnCount:Int;
	public var spawnInterval:Float;

	public var data(default, set):IEmitterData;
	public var pool(default, set):IPool;
	public var force(default, set):IForce;

	public function emit(count:Int):Void;
}
