package test.js;

import js.Browser;
import js.html.CanvasRenderingContext2D;
import js.html.CanvasElement;
import hxfireflies.particle.IParticleView;

class JsParticleView implements IParticleView {
	public var x(get, set):Float;
	public var y(get, set):Float;
	@:isVar public var scaleX(get, set):Float;
	@:isVar public var scaleY(get, set):Float;
	public var scale(default, set):Float = 1;
	@:isVar public var angle(get, set):Float;
	@:isVar public var alpha(get, set):Float;

	static public var ctx:CanvasRenderingContext2D = null;

	var _radius:Float = 20;
	var _x:Float = 0;
	var _y:Float = 0;

	public function new(radius:Float = 20) {
		_radius = radius;
		if(ctx == null) {
			var canvas:CanvasElement = cast Browser.document.getElementById('canvas');
			if(canvas != null) {
				ctx = canvas.getContext('2d');
			}
		}
	}

	public function dispose() {
	}

	public function clone():IParticleView {
		return new JsParticleView(_radius);
	}

	function draw() {
		if(ctx != null) {
			var rad:Float = angle * Math.PI / 180;
			ctx.beginPath();
			ctx.ellipse(_x, _y, _radius * scaleX, _radius * scaleY, angle * Math.PI / 180, 0, 2 * Math.PI);
			ctx.fillStyle = 'rgba(255, 0, 0, $alpha)';
			ctx.fill();
		}
	}

	function set_scale(value:Float):Float {
		scaleY = scaleX = value;
		if(scaleX < 0) {
			scaleY = scaleX = 0;
		}
		draw();
		return scale;
	}

	function get_scaleX():Float {
		return scaleX;
	}

	function set_scaleX(value:Float):Float {
		scaleX = value;
		if(scaleX < 0) {
			scaleX = 0;
		}
		draw();
		return scale;
	}

	function get_scaleY():Float {
		return scaleY;
	}

	function set_scaleY(value:Float):Float {
		scaleY = value;
		if(scaleY < 0) {
			scaleY = 0;
		}
		draw();
		return scale;
	}

	function get_angle():Float {
		return angle;
	}

	function set_angle(value:Float):Float {
		angle = value;
		draw();
		return angle;
	}

	function get_alpha():Float {
		return alpha;
	}

	function set_alpha(value:Float):Float {
		alpha = value;
		draw();
		return alpha;
	}

	function get_x():Float {
		return _x;
	}

	function set_x(value:Float):Float {
		_x = value;
		draw();
		return _x;
	}

	function get_y():Float {
		return _y;
	}

	function set_y(value:Float):Float {
		_y = value;
		draw();
		return _y;
	}
}
