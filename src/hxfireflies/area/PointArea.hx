package hxfireflies.area;

import hxfireflies.particle.IParticle;

class PointArea implements IArea {
	@:isVar public var x(get, set):Float;
	@:isVar public var y(get, set):Float;

	public function new(x:Float = .0, y:Float = .0) {
		this.x = x;
		this.y = y;
	}

	public function dispose() {
		x = y = .0;
	}

	public function setup(particle:IParticle):IParticle {
		particle.x = x;
		particle.y = y;

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
