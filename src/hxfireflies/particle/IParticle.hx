package hxfireflies.particle;

import hxdispose.IDisposable;

interface IParticle extends IDisposable {
	public var x(get, set):Float;
	public var y(get, set):Float;
	public var isLife(get, never):Bool;

	public var lifetime:Float;
	public var time:Float;

	public var xVelocity:Float;
	public var yVelocity:Float;

	public function update(dt:Float):Void;
	public function clone():IParticle;
}
