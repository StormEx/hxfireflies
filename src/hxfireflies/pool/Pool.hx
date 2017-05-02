package hxfireflies.pool;

import hxfireflies.particle.IParticleView;
import hxfireflies.particle.Particle;
import hxfireflies.particle.IParticle;
import hxdispose.Dispose;
import hxdispose.DisposableArray;

class Pool implements IPool {
	public var prototype(default, set):IParticle;
	public var length(get, never):Int;

	var _pool:DisposableArray<IParticle> = [];
	var _max:Int = 50;

	public function new(max:Int = 50) {
		if(max > 0) {
			_max = max;
		}

		prototype = createPrototype(null);
	}

	public function dispose() {
		Dispose.dispose(_pool);
	}

	public function update(dt:Float) {
		for(p in _pool) {
			p.update(dt);
		}
	}

	public function push(particle:IParticle) {
	}

	public function pop():IParticle {
		return null;
	}

	function increasePool() {
	}

	function createPrototype(view:IParticleView) {
		return new Particle(view);
	}

	inline function set_prototype(value:IParticle):IParticle {
		var tmp = prototype;
		prototype = value;

		return tmp;
	}

	function get_length():Int {
		return _pool.length;
	}
}
