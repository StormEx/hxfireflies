package hxfireflies.area;

import hxfireflies.particle.IParticle;

class RingArea implements IArea {
	@:isVar public var x(get, set):Float;
	@:isVar public var y(get, set):Float;
	public var minRadius:Float;
	public var maxRadius:Float;

	public function new(min:Float = .0, max:Float = 100.0) {
		minRadius = min;
		maxRadius = max;
	}

	public function dispose() {
	}

	public function setup(particle:IParticle):IParticle {
		var angle:Float = Math.random() * 2 * Math.PI;
		var size:Float = minRadius + Math.random() * (maxRadius - minRadius);
		var kx:Float = Math.cos(angle);
		var ky:Float = Math.sin(angle);
		particle.x = x + kx * size;
		particle.y = y + ky * size;
		particle.xVelocity = kx;
		particle.yVelocity = ky;

		return particle;
	}

	inline function get_x():Float {
		return x;
	}

	inline function set_x(value:Float):Float {
		return x = value;
	}

	inline function get_y():Float {
		return y;
	}

	inline function set_y(value:Float):Float {
		return y = value;
	}
}
