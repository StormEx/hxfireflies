package hxfireflies.forces;

import hxfireflies.particle.IParticle;

class ForceCollection implements IForce {
	public var enabled(default, set):Bool = true;

	var _forces:Array<IForce> = [];

	public function new() {
	}

	public function add(force:IForce) {
		_forces.push(force);
	}

	public function remove(force:IForce) {
		var index:Int = _forces.indexOf(force);
		if(index != -1) {
			_forces.splice(index, 1);
		}
	}

	public function update(dt:Float) {
		for(f in _forces) {
			f.update(dt);
		}
	}

	public function apply(particle:IParticle) {
		if(enabled) {
			for(f in _forces) {
				f.apply(particle);
			}
		}
	}

	function set_enabled(value:Bool):Bool {
		return enabled = value;
	}
}
