package hxfireflies.forces;

import hxfireflies.particle.IParticle;

class Force implements IForce {
	public var enable:Bool = true;

	var _xVelocity:Float = 0;
	var _yVelocity:Float = 0;

	public function new() {
	}

	public function update(dt:Float) {
	}

	public function apply(particle:IParticle) {
		if(enable) {
			particle.xForce += _xVelocity;
			particle.yForce += _yVelocity;
		}
	}
}
