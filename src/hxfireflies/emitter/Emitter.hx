package hxfireflies.emitter;

import hxfireflies.forces.IForce;
import hxfireflies.particle.IParticleView;
import hxfireflies.particle.IParticle;
import hxfireflies.particle.Particle;
import hxfireflies.pool.Pool;
import hxfireflies.pool.IPool;
import hxdispose.Dispose;
import hxfireflies.area.PointArea;
import hxfireflies.area.IArea;

class Emitter extends Particle implements IEmitter {
	public var spawnCount:Int = 1;
	public var spawnInterval:Float = 1000;

	public var data(default, set):IEmitterData;
	public var pool(default, set):IPool;
	public var force(default, set):IForce;

	var _time:Float = 0;

	public function new(view:IParticleView = null) {
		super(view);

		pool = createPool();
	}

	override public function dispose() {
		super.dispose();

		Dispose.dispose(pool);
	}

	public function emit(count:Int) {
		pool.alloc(count, data);
	}

	override public function update(dt:Float) {
		if(super.isLife) {
			super.update(dt);
		}

		pool.update(dt, force);
		_time += dt;
		if(_time >= spawnInterval && super.isLife && enable) {
			_time = 0;

			pool.alloc(spawnCount, data);
		}
	}

	override public function clone():IParticle {
		return null;
	}

	override function get_isLife():Bool {
		return super.isLife || pool.length > 0;
	}

	function createArea():IArea {
		return new PointArea();
	}

	function createPool():IPool {
		return new Pool();
	}

	override public function set_enable(value:Bool):Bool {
		trace(value);
		if(enable != value) {
			super.enable = value;
			if(!enable) {
				pool.reset();
			}
		}

		return enable;
	}

	function get_data():IEmitterData {
		return data;
	}

	function set_data(value:IEmitterData):IEmitterData {
		return data = value;
	}

	override function set_x(value:Float):Float {
		data.area.x = value;
		return super.set_x(value);
	}

	override function set_y(value:Float):Float {
		data.area.y = value;
		return super.set_y(value);
	}

	function set_pool(value:IPool):IPool {
		if(pool != value) {
			pool = value == null ? createPool() : value;
		}

		return pool;
	}

	function set_force(value:IForce):IForce {
		return force = value;
	}
}
