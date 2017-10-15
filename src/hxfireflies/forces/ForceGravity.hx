package hxfireflies.forces;

class ForceGravity extends Force {
	public function new(valueY:Float = 2, valueX:Float = 0) {
		super();

		_xVelocity = valueX;
		_yVelocity = valueY;
	}
}
