package hxfireflies.emitter;

import hxfireflies.particle.IParticle;
import hxfireflies.area.IArea;

class EmitterData implements IEmitterData {
	public var x:Float = 0;
	public var y:Float = 0;
	public var area(default, set):IArea;

	public function new() {
	}

	public function setup(particle:IParticle):IParticle {
		area.setup(particle);
		particle.time = 0;

		return particle;
	}

	function set_area(value:IArea):IArea {
		return area = value;
	}
}
