package dl;

import flash.display.Shape;
import flash.Lib;
import hxfireflies.particle.IParticleView;

class DLParticleView implements IParticleView {
	public var x(get, set):Float;
	public var y(get, set):Float;

	var _shape:Shape = null;

	public function new() {
		_shape = new Shape();
		_shape.graphics.beginFill(0xFF0000);
		_shape.graphics.drawCircle(0, 0, 20);
		_shape.graphics.endFill();

		Lib.current.addChild(_shape);
	}

	public function dispose() {
		Lib.current.removeChild(_shape);

		_shape = null;
	}

	public function clone():IParticleView {
		return null;
	}

	function get_x():Float {
		return _shape.x;
	}

	function set_x(value:Float):Float {
		return _shape.x = value;
	}

	function get_y():Float {
		return _shape.y;
	}

	function set_y(value:Float):Float {
		return _shape.y = value;
	}
}
