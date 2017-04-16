package hxfireflies.pool;

import hxdispose.IDisposable;

interface IPool extends IDisposable {
	public var prototype(default, set):IParticle;
	public var length(get, never):Int;

	public function update(dt:Float):Void;
	public function push(particle:IParticle):Void;
	public function pop():IParticle;
}
