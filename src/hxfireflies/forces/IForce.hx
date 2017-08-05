package hxfireflies.forces;

import hxfireflies.particle.IParticle;

interface IForce {
	public var enabled(default, set):Bool;

	public function update(dt:Float):Void;
	public function apply(particle:IParticle):Void;
}
