package hxfireflies.particle;

import hxdispose.Dispose;

class Particle implements IParticle {
	public var x(get, set):Float;
	public var y(get, set):Float;

	public var lifetime:Float = .0;

	public var xVelocity:Float = .0;
	public var yVelocity:Float = .0;

	var _view:IParticleView = null;

	public function new(view:IParticleView) {
		_view = view;
	}

	public function dispose() {
		Dispose.dispose(_view);
	}

	public function update(dt:Float) {
	}

	public function clone():IParticle {
		return new Particle(_view.clone());
	}

	function get_x():Float {
		return 0;
	}

	function set_x(value:Float):Float {
		return 0;
	}

	function get_y():Float {
		return 0;
	}

	function set_y(value:Float):Float {
		return 0;
	}
}
