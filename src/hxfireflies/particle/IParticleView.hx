package hxfireflies.particle;

import hxdispose.IDisposable;

interface IParticleView extends IDisposable {
	public var x(get, set):Float;
	public var y(get, set):Float;
	public var scaleX(get, set):Float;
	public var scaleY(get, set):Float;
	public var angle(get, set):Float;
	public var alpha(get, set):Float;

	public var visible(get, set):Bool;

	public function clone():IParticleView;
}
