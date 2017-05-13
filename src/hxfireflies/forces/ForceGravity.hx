package hxfireflies.forces;

class ForceGravity extends Force {
	public function new(value:Float = 2) {
		super();

		_xVelocity = 0;
		_yVelocity = value;
	}
}
