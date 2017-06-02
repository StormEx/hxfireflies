package hxfireflies.pool;

import hxfireflies.forces.IForce;
import hxfireflies.emitter.IEmitterData;
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
			if(_count >= _max) {
				return;
			}

			var p:IParticle = null;
			if(_count < _pool.length) {
				p = _pool[_count];
			}
			else {
				p = prototype.clone();
				_pool.push(p);
				trace(_pool.length);

			}
			p.enable = true;
			data.setup(p);
			++_count;
		}
	}

	public function reset() {
		for(i in 0..._count) {
			_pool[i].enable = false;
		}
		_count = 0;
	}

	public function clone():IPool {
		var p:Pool = new Pool();
		p.prototype = prototype.clone();

		return p;
	}

	function remove(index:Int) {
		--_count;
		var tmp:IParticle = _pool[index];
		_pool[index] = _pool[_count];
		_pool[_count] = tmp;
		tmp.enable = false;
	}

	function increasePool() {
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
