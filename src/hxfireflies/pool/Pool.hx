package hxfireflies.pool;

import hxfireflies.forces.IForce;
import hxfireflies.emitter.IEmitterData;
import hxfireflies.particle.IParticleView;
import hxfireflies.particle.Particle;
import hxfireflies.particle.IParticle;
import hxdispose.Dispose;

class Pool implements IPool {
	public var prototype(default, set):IParticle;
	public var length(get, never):Int;

	var _pool:Array<IParticle> = [];
	var _count:Int = 0;
	var _max:Int = 50;

	public function new(max:Int = 50) {
		if(max > 0) {
			_max = max;
		}

		prototype = createPrototype(null);
	}

	public function dispose() {
		Dispose.disposeIterable(_pool);
	}

	public function update(dt:Float, force:IForce) {
		var i:Int = 0;
		while(i < _count) {
			_pool[i].update(dt, force);
			if(!_pool[i].isLife) {
				remove(i);
			}
			else {
				++i;
			}
		}
	}

	public function alloc(count:Int, data:IEmitterData) {
		for(i in 0...count) {
			var p:IParticle = null;
			if(_count < _pool.length)
			{
				p = _pool[_count];
			}
			else {
				p = prototype.clone();
				_pool.push(p);
				trace(_pool.length);

			}
			data.setup(p);
			++_count;
		}
	}

	function remove(index:Int) {
		--_count;
		var tmp:IParticle = _pool[index];
		_pool[index] = _pool[_count];
		_pool[_count] = tmp;
	}

	function increasePool() {
	}

	function createPrototype(view:IParticleView):IParticle {
		return new Particle(view);
	}

	inline function set_prototype(value:IParticle):IParticle {
		var tmp = prototype;
		prototype = value;

		return tmp;
	}

	function get_length():Int {
		return _count;
	}
}
