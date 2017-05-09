package hxfireflies.area;

import hxfireflies.particle.IParticle;

class CircleArea implements IArea {
	@:isVar public var x(get, set):Float;
	@:isVar public var y(get, set):Float;
	public var radius:Float;

	public function new(radius:Float = 100.0) {
		this.radius = radius;
	}

	public function dispose() {
	}

	public function setup(particle:IParticle):IParticle {
		var angle:Float = Math.random() * 2 * Math.PI;
		var size:Float = Math.random() * radius;
		particle.x = x + Math.cos(angle) * size;
		particle.y = y + Math.sin(angle) * size;

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
