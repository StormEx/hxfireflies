package hxfireflies.animators;

class AnimatorIn implements IAnimator {
	public function new() {
	}

	public function calculate(ratio:Float, value:Float):Float {
		var inv:Float = 1 - ratio;

		return (inv * inv * inv + 1) * value;
	}
}
