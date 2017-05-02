package hxfireflies.area;

import hxfireflies.particle.IParticle;

class RectangleArea implements IArea {
	@:isVar public var x(get, set):Float;
	@:isVar public var y(get, set):Float;
	public var width:Float;
	public var height:Float;

	public function new(width:Float = 100.0, height:Float = 100.0) {
		this.width = width;
		this.height = height;
	}

	public function dispose() {
	}

	public function setup(particle:IParticle):IParticle {
		particle.x = x + (Math.random() * width - width * 0.5);
		particle.y = y + (Math.random() * height - height * 0.5);

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
