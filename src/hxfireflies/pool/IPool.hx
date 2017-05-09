package hxfireflies.pool;

import hxfireflies.emitter.IEmitterData;
import hxfireflies.particle.IParticle;
import hxdispose.IDisposable;

interface IPool extends IDisposable {
	public var prototype(default, set):IParticle;
	public var length(get, never):Int;

	public function update(dt:Float):Void;
	public function alloc(count:Int, data:IEmitterData):Void;
}
