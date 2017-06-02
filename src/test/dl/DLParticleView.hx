package test.dl;

import flash.display.Shape;
import flash.Lib;
import hxfireflies.particle.IParticleView;

class DLParticleView implements IParticleView {
	public var x(get, set):Float;
	public var y(get, set):Float;
	public var scaleX(get, set):Float;
	public var scaleY(get, set):Float;
	public var angle(get, set):Float;
	public var alpha(get, set):Float;

	public var visible(get, set):Bool;

	public var shape:Shape = null;

	var _radius:Float = 20;
	var _alt:Bool = false;

	public function new(radius:Float = 20, alt:Bool = false) {
		_alt = alt;
		_radius = radius;
		shape = new Shape();
		shape.graphics.beginFill(0xFF0000);
		if(alt) {
			shape.graphics.drawRect(0, 0, radius, radius);
		}
		else {
			shape.graphics.drawCircle(0, 0, radius);
		}
		shape.graphics.endFill();

		Lib.current.addChild(shape);
	}

	public function dispose() {
		Lib.current.removeChild(shape);

		shape = null;
	}

	public function clone():IParticleView {
		return new DLParticleView(_radius, _alt);
	}

	function get_scaleX():Float {
		return 0;
	}

	function set_scaleX(value:Float):Float {
		return shape.scaleX = value;
	}

	function get_scaleY():Float {
		return 0;
	}

	function set_scaleY(value:Float):Float {
		return shape.scaleY = value;
	}

	function get_angle():Float {
		return shape.rotation;
	}

	function set_angle(value:Float):Float {
		return shape.rotation = value;
	}

	function get_alpha():Float {
		return shape.alpha;
	}

	function set_alpha(value:Float):Float {
		return shape.alpha = value;
	}

	function get_visible():Bool {
		return shape.visible;
	}

	function set_visible(value:Bool):Bool {
		return shape.visible = value;
	}

	function get_x():Float {
		return shape.x;
	}

	function set_x(value:Float):Float {
		return shape.x = value;
	}

	function get_y():Float {
		return shape.y;
	}

	function set_y(value:Float):Float {
		return shape.y = value;
	}
}
