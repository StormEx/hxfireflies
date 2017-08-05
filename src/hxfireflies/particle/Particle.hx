package hxfireflies.particle;

import hxfireflies.animators.IAnimator;
import hxdispose.Dispose;

class Particle implements IParticle {
	public var x(get, set):Float;
	public var y(get, set):Float;
	public var isLife(get, never):Bool;
	public var enable(default, set):Bool;

	public var lifetime:Float = -1.0;
	public var age:Float = 0;

	public var scaleX:Float = 1;
	public var scaleXDelta:Float = 0;
	public var scaleXAnimator:IAnimator = null;
	public var scaleY:Float = 1;
	public var scaleYDelta:Float = 0;
	public var scaleYAnimator:IAnimator = null;

	public var angle:Float = 0;
	public var angleDelta:Float = 0;
	public var angleAnimator:IAnimator = null;
	public var spin:Float = 0;
	public var spinDelta:Float = 0;
	public var spinAnimator:IAnimator = null;

	public var alpha:Float = 1;
	public var alphaDelta:Float = 0;
	public var alphaAnimator:IAnimator = null;

	public var xVelocity:Float = 0;
	public var xVelocityDelta:Float = 0;
	public var yVelocity:Float = 0;
	public var yVelocityDelta:Float = 0;
	public var velocityAnimator:IAnimator = null;

	public var xForceVelocity:Float = 0;
	public var yForceVelocity:Float = 0;

	var _view:IParticleView = null;

	public function new(view:IParticleView) {
		_view = view;
	}

	public function dispose() {
		Dispose.dispose(_view);
	}

	public function update(dt:Float) {
		var k:Float = 1;

		age += dt;
		if(lifetime >= 0 && age < lifetime) {
			k = age / lifetime;
		}

		_view.scaleX = scaleX + calculateValue(k, scaleXDelta, scaleXAnimator);
		_view.scaleY = scaleY + calculateValue(k, scaleYDelta, scaleYAnimator);
		if(spin != 0 || spinDelta != 0) {
			_view.angle += (spin + calculateValue(k, spinDelta, spinAnimator)) * (dt / 1000);
		}
		else {
			_view.angle = angle + calculateValue(k, angleDelta, angleAnimator);
		}
		_view.alpha = alpha + calculateValue(k, alphaDelta, alphaAnimator);

		x += (xVelocity + calculateValue(k, xVelocityDelta, velocityAnimator) + xForceVelocity) * dt / 1000;
		y += (yVelocity + calculateValue(k, yVelocityDelta, velocityAnimator) + yForceVelocity) * dt / 1000;
	}

	public function clone():IParticle {
		return new Particle(_view.clone());
	}

	inline function calculateValue(progress:Float, value:Float, animator:IAnimator):Float {
		return animator == null ? 0 : animator.calculate(progress, value);
	}

	function get_isLife():Bool {
		return lifetime < 0 || lifetime > age;
	}

	public function set_enable(value:Bool):Bool {
		if(enable != value) {
			enable = value;

			_view.visible = value;
		}

		return enable;
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
