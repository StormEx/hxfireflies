package hxfireflies.animators;

class AnimatorOut implements IAnimator {
	public function new() {
	}

	public function calculate(ratio:Float, value:Float):Float {
		return ratio * ratio * ratio * value;
	}
}
