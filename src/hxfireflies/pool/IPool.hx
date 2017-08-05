package hxfireflies.pool;

import hxfireflies.forces.IForce;
import hxfireflies.emitter.IEmitterData;
import hxdispose.IDisposable;

interface IPool extends IDisposable {
	public var length(get, never):Int;
	public var maxLength(get, set):Int;

	public function update(dt:Float, force:IForce):Void;
	public function alloc(count:Int, data:IEmitterData):Void;
	public function reset():Void;
	public function clone():IPool;
}
