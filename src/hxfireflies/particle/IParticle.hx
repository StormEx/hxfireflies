package hxfireflies.particle;

import hxfireflies.animators.IAnimator;
import hxdispose.IDisposable;

interface IParticle extends IDisposable {
	public var x(get, set):Float;
	public var y(get, set):Float;
	public var isLife(get, never):Bool;

	public var lifetime:Float;
	public var time:Float;

	public var scaleX:Float;
	public var scaleXDelta:Float;
	public var scaleXAnimator:IAnimator;
	public var scaleY:Float;
	public var scaleYDelta:Float;
	public var scaleYAnimator:IAnimator;

	public var angle:Float;
	public var angleDelta:Float;
	public var angleAnimator:IAnimator;

	public var spin:Float;
	public var spinDelta:Float;
	public var spinAnimator:IAnimator;

	public var alpha:Float;
	public var alphaDelta:Float;
	public var alphaAnimator:IAnimator;

	public var xVelocity:Float;
	public var xVelocityDelta:Float;
	public var yVelocity:Float;
	public var yVelocityDelta:Float;
	public var velocityAnimator:IAnimator;

	public function update(dt:Float):Void;
	public function clone():IParticle;
}
