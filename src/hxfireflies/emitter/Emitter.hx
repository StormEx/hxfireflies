package hxfireflies.emitter;

import hxfireflies.particle.IParticleView;
import hxfireflies.particle.IParticle;
import hxfireflies.particle.Particle;
import hxfireflies.pool.Pool;
import hxfireflies.pool.IPool;
import haxe.macro.Expr;
import hxdispose.Dispose;
import hxfireflies.area.PointArea;
import hxfireflies.area.IArea;

class Emitter extends Particle implements IEmitter {
	public var data(get, set):IEmitterData;

	public var pool(default, set):IPool;

	public var r(default, set):Float = 1.0;
	public var rDelta(default, set):Float = .0;
	public var g(default, set):Float = 1.0;
	public var gDelta(default, set):Float = .0;
	public var b(default, set):Float = 1.0;
	public var bDelta(default, set):Float = .0;
	public var a(default, set):Float = 1.0;
	public var aDelta(default, set):Float = .0;

	public function new(view:IParticleView = null) {
		super(view);

		pool = createPool();

		normalize();
	}

	override public function dispose() {
		super.dispose();

		Dispose.dispose(pool);
	}

	override public function update(dt:Float) {
		super.update(dt);

		pool.update(dt);
	}

	override public function clone():IParticle {
		return null;
	}

	function createArea():IArea {
		return new PointArea();
	}

	function createPool():IPool {
		return new Pool();
	}

	function normalize() {
		normalizeColor(r, rDelta);
		normalizeColor(g, gDelta);
		normalizeColor(b, bDelta);
		normalizeColor(a, aDelta);
	}

	macro static function normalizeColor(comp:Expr, delta:Expr) {
		return macro {
			if($comp > 1.0) {
				$comp = 1.0;
			}
			else if($comp < .0) {
				$comp = .0;
			}

			if($delta < .0) {
				$delta = .0;
			}
			else if($comp + $delta > 1.0) {
				$delta = 1.0 - $comp;
			}
		};
	}

	function get_data():IEmitterData {
		return null;
	}

	function set_data(value:IEmitterData):IEmitterData {
		return null;
	}

	inline function set_pool(value:IPool):IPool {
		if(pool != value) {
			pool = value == null ? createPool() : value;
		}

		return pool;
	}

	inline function set_r(value:Float):Float {
		if(r != value) {
			r = value;

			normalizeColor(r, rDelta);
		}

		return r;
	}

	inline function set_rDelta(value:Float):Float {
		if(rDelta != value) {
			rDelta = value;

			normalizeColor(r, rDelta);
		}

		return rDelta;
	}

	inline function set_g(value:Float):Float {
		if(g != value) {
			g = value;

			normalizeColor(g, gDelta);
		}

		return g;
	}

	inline function set_gDelta(value:Float):Float {
		if(gDelta != value) {
			gDelta = value;

			normalizeColor(g, gDelta);
		}

		return gDelta;
	}

	inline function set_b(value:Float):Float {
		if(b != value) {
			b = value;

			normalizeColor(b, bDelta);
		}

		return b;
	}

	inline function set_bDelta(value:Float):Float {
		if(bDelta != value) {
			bDelta = value;

			normalizeColor(b, bDelta);
		}

		return bDelta;
	}

	inline function set_a(value:Float):Float {
		if(a != value) {
			a = value;

			normalizeColor(a, aDelta);
		}

		return a;
	}

	inline function set_aDelta(value:Float):Float {
		if(aDelta != value) {
			aDelta = value;

			normalizeColor(a, aDelta);
		}

		return aDelta;
	}
}
