package hxfireflies.particle;

import hxfireflies.animators.IAnimator;
import hxdispose.Dispose;

class Particle implements IParticle {
	public var x(get, set):Float;
	public var y(get, set):Float;
	public var scaleX:Float = 1;
	public var scaleXDelta:Float = 0;
	public var scaleXAnimator:IAnimator = null;
	public var scaleY:Float = 1;
	public var scaleYDelta:Float = 0;
	public var scaleYAnimator:IAnimator = null;
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
		var k:Float = 1;
		if(lifetime >= 0) {
			time += dt;

			k = time / lifetime;
		}

		_view.scaleX = scaleX + calculateValue(k, scaleXDelta, scaleXAnimator);
		_view.scaleY = scaleY + calculateValue(k, scaleYDelta, scaleYAnimator);
	}

	public function clone():IParticle {
		return new Particle(_view.clone());
	}

	inline function calculateValue(progress:Float, value:Float, animator:IAnimator):Float {
		return animator == null ? value * progress : animator.calculate(progress, value);
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
