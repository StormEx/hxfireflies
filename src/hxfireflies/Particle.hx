package hxfireflies;

class Particle implements IParticle {
	public var x:Float = .0;
	public var y:Float = .0;

	public var lifetime:Float = .0;

	public var xVelocity:Float = .0;
	public var yVelocity:Float = .0;

	public function new() {
	}

	public function dispose() {
	}

	public function update(dt:Float) {
	}

	public function clone():IParticle {
		return new Particle();
	}
}
