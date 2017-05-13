package hxfireflies.animators;

class AnimatorLinear implements IAnimator {
	public function new() {
	}

	public function calculate(ratio:Float, value:Float):Float {
		return ratio * value;
	}
}
