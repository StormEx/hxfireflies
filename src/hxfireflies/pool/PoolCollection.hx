package hxfireflies.pool;

import hxfireflies.emitter.IEmitterData;

class PoolCollection implements IPool {
	public var length(get, never):Int;

	var _pools:Array<IPool> = [];

	public function new() {
	}

	public function dispose() {
	}

	public function update(dt:Float) {
		for(p in _pools) {
			p.update(dt);
		}
	}

	public function add(pool:IPool) {
		_pools.push(pool);
	}

	public function alloc(count:Int, data:IEmitterData) {

	}

	function get_length():Int {
		var res:Int = 0;
		for(p in _pools) {
			res += p.length;
		}

		return res;
	}
}
