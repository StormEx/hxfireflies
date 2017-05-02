package dl;

import hxfireflies.particle.Particle;
import hxfireflies.particle.IParticle;

class DLParticle extends Particle {
	public function new() {
		super(new DLParticleView());
	}

	override public function dispose() {
		super.dispose();
	}

	override public function clone():IParticle {
		return new DLParticle();
	}

	override function get_x():Float {
		return _view != null ? _view.x : 0;
	}

	override function set_x(value:Float):Float {
		return _view != null ? _view.x = value : value;
	}

	override function get_y():Float {
		return _view != null ? _view.y : 0;
	}

	override function set_y(value:Float):Float {
		return _view != null ? _view.y = value : value;
	}
}
