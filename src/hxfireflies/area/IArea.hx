package hxfireflies.area;

import hxdispose.IDisposable;

interface IArea extends IDisposable {
	public var x(get, set):Float;
	public var y(get, set):Float;

	public function setup(particle:IParticle):IParticle;
}
