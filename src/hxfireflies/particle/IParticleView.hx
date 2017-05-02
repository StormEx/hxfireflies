package hxfireflies.particle;

import hxdispose.IDisposable;

interface IParticleView extends IDisposable {
	public var x(get, set):Float;
	public var y(get, set):Float;

	public function clone():IParticleView;
}
