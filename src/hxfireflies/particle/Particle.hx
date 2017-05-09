package hxfireflies.particle;

import hxdispose.Dispose;

class Particle implements IParticle {
	public var x(get, set):Float;
	public var y(get, set):Float;
	public var isLife(get, never):Bool;

	public var lifetime:Float = -1.0;
	public var time:Float = 0;

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
		if(lifetime >= 0) {
			time += dt;
		}
	}

	public function clone():IParticle {
		return new Particle(_view.clone());
	}

	function get_isLife():Bool {
		return lifetime < 0 || lifetime > time;
	}

	function get_x():Float {
		return _view != null ? _view.x : 0;
	}

	function set_x(value:Float):Float {
		return _view != null ? _view.x = value : value;
	}

	function get_y():Float {
		return _view != null ? _view.y : 0;
	}

	function set_y(value:Float):Float {
		return _view != null ? _view.y = value : value;
	}
}
