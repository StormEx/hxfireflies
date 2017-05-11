package test.js;

import js.Browser;
import js.html.CanvasRenderingContext2D;
import js.html.CanvasElement;
import hxfireflies.particle.IParticleView;

class JsParticleView implements IParticleView {
	@:isVar public var x(get, set):Float;
	@:isVar public var y(get, set):Float;
	@:isVar public var scaleX(get, set):Float;
	@:isVar public var scaleY(get, set):Float;
	public var scale(default, set):Float = 1;

	static public var ctx:CanvasRenderingContext2D = null;

	var _radius:Float = 20;

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
			ctx.beginPath();
			ctx.ellipse(x, y, _radius * scaleX, _radius * scaleY, 45 * Math.PI/180, 0, 2 * Math.PI);
			ctx.fillStyle = "#FF0000";
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

	function get_x():Float {
		return x;
	}

	function set_x(value:Float):Float {
		x = value;
		draw();
		return x;
	}

	function get_y():Float {
		return y;
	}

	function set_y(value:Float):Float {
		y = value;
		draw();
		return y;
	}
}
