package hxfireflies.particle;

import hxfireflies.animators.IAnimator;
import hxdispose.IDisposable;

interface IParticle extends IDisposable {
	public var x(get, set):Float;
	public var y(get, set):Float;
	public var scaleX:Float;
	public var scaleXDelta:Float;
	public var scaleXAnimator:IAnimator;
	public var scaleY:Float;
	public var scaleYDelta:Float;
	public var scaleYAnimator:IAnimator;
	public var isLife(get, never):Bool;

	public var lifetime:Float;
	public var time:Float;

	public var xVelocity:Float;
	public var yVelocity:Float;

	public function update(dt:Float):Void;
	public function clone():IParticle;
}
