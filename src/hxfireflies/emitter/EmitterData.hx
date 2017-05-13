package hxfireflies.emitter;

import hxfireflies.animators.IAnimator;
import hxfireflies.particle.IParticle;
import hxfireflies.area.IArea;

class EmitterData implements IEmitterData {
	public var x:Float = 0;
	public var y:Float = 0;
	public var area(default, set):IArea;

	public var lifetime:Float = -1;
	public var lifetimeDelta:Float = 0;

	public var scaleSimple:Bool = true;
	public var scaleFrom:Float = 1;
	public var scaleFromDelta:Float = 0;
	public var scaleTo:Float = 1;
	public var scaleToDelta:Float = 0;
	public var scaleAnimator:IAnimator = null;

	public var scaleYFrom:Float = 1;
	public var scaleYFromDelta:Float = 0;
	public var scaleYTo:Float = 1;
	public var scaleYToDelta:Float = 0;
	public var scaleYAnimator:IAnimator = null;

	public var angleFrom:Float = 0;
	public var angleFromDelta:Float = 0;
	public var angleTo:Float = 0;
	public var angleToDelta:Float = 0;
	public var angleAnimator:IAnimator = null;

	public var spinFrom:Float = 0;
	public var spinFromDelta:Float = 0;
	public var spinTo:Float = 0;
	public var spinToDelta:Float = 0;
	public var spinAnimator:IAnimator = null;

	public var alphaFrom:Float = 0;
	public var alphaFromDelta:Float = 0;
	public var alphaTo:Float = 0;
	public var alphaToDelta:Float = 0;
	public var alphaAnimator:IAnimator = null;

	public var velocityFrom:Float = 0;
	public var velocityFromDelta:Float = 0;
	public var velocityTo:Float = 0;
	public var velocityToDelta:Float = 0;
	public var velocityAnimator:IAnimator = null;

	// color

	public function new() {
	}

	public function setup(particle:IParticle):IParticle {
		area.setup(particle);

		particle.time = 0;
		particle.lifetime = calculateValue(lifetime, lifetimeDelta);
		if(scaleSimple) {
			particle.scaleY = particle.scaleX = calculateValue(scaleFrom, scaleFromDelta);
			particle.scaleYDelta = particle.scaleXDelta = calculateValue(scaleTo, scaleToDelta) - particle.scaleX;
			particle.scaleYAnimator = particle.scaleXAnimator = scaleAnimator;
		}
		else {
			particle.scaleX = calculateValue(scaleFrom, scaleFromDelta);
			particle.scaleXDelta = calculateValue(scaleTo, scaleToDelta) - particle.scaleX;
			particle.scaleXAnimator = scaleAnimator;
			particle.scaleY = calculateValue(scaleYFrom, scaleYFromDelta);
			particle.scaleYDelta = calculateValue(scaleYTo, scaleYToDelta) - particle.scaleY;
			particle.scaleYAnimator = scaleYAnimator;
		}

		particle.angle = calculateValue(angleFrom, angleFromDelta);
		particle.angleDelta = calculateValue(angleTo, angleToDelta) - particle.angle;
		particle.angleAnimator = angleAnimator;

		particle.spin = calculateValue(spinFrom, spinFromDelta);
		particle.spinDelta = calculateValue(spinTo, spinToDelta) - particle.spin;
		particle.spinAnimator = spinAnimator;

		particle.alpha = calculateValue(alphaFrom, alphaFromDelta);
		particle.alphaDelta = calculateValue(alphaTo, alphaToDelta) - particle.alpha;
		particle.alphaAnimator = alphaAnimator;

		var vx:Float = particle.xVelocity;
		var vy:Float = particle.yVelocity;
		var from:Float = calculateValue(velocityFrom, velocityFromDelta);
		var delta:Float = calculateValue(velocityTo, velocityToDelta) - from;
		particle.xVelocity = vx * from;
		particle.xVelocityDelta = vx * delta;
		particle.yVelocity = vy * from;
		particle.yVelocityDelta = vy * delta;
		particle.velocityAnimator = velocityAnimator;

//		particle.xVelocity = 80;
//		particle.yVelocity = 0;

		particle.update(0);

		return particle;
	}

	function calculateValue(value:Float, delta:Float):Float {
		return value + delta * Math.random();
	}

	function set_area(value:IArea):IArea {
		return area = value;
	}
}
