package hxfireflies.pool;

import hxfireflies.forces.IForce;
import hxfireflies.emitter.IEmitterData;
import hxfireflies.particle.IParticle;
import hxdispose.Dispose;

class Pool implements IPool {
	public var prototype(default, set):IParticle;
	public var length(get, never):Int;
	public var maxLength(get, set):Int;

	var _pool:Array<IParticle> = [];
	var _count:Int = 0;
	var _max:Int = 50;

	public function new(max:Int = 50) {
		maxLength = max;
	}

	public function dispose() {
		Dispose.disposeIterable(_pool);
	}

	public function update(dt:Float, force:IForce) {
		var i:Int = 0;
		while(i < _count) {
			if(force != null) {
				force.apply(_pool[i]);
			}
			_pool[i].update(dt);
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

	function clamp() {
		while(_pool.length > maxLength) {
			var p:IParticle = _pool.pop();
			Dispose.dispose(p);
		}
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

	function get_maxLength():Int {
		return _max;
	}

	function set_maxLength(value:Int):Int {
		if(value > 0 && value != _max) {
			_max = value;

			clamp();
		}

		return _max;
	}
}
