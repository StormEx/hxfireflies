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

	public var scaleFrom:Float = 1;
	public var scaleFromDelta:Float = 0;
	public var scaleTo:Float = 1;
	public var scaleToDelta:Float = 0;
	public var scaleAnimator:IAnimator = null;

	public var scaleXFrom:Float = 1;
	public var scaleXFromDelta:Float = 0;
	public var scaleXTo:Float = 1;
	public var scaleXToDelta:Float = 0;
	public var scaleXAnimator:IAnimator = null;

	public var scaleYFrom:Float = 1;
	public var scaleYFromDelta:Float = 0;
	public var scaleYTo:Float = 1;
	public var scaleYToDelta:Float = 0;
	public var scaleYAnimator:IAnimator = null;

	public function new() {
	}

	public function setup(particle:IParticle):IParticle {
		area.setup(particle);

		particle.time = 0;
		particle.lifetime = calculateValue(lifetime, lifetimeDelta);
		if(scaleFrom + scaleFromDelta != 0 || scaleTo + scaleToDelta != 0) {
			particle.scaleY = particle.scaleX = calculateValue(scaleFrom, scaleFromDelta);
			particle.scaleYDelta = particle.scaleXDelta = calculateValue(scaleTo, scaleToDelta) - particle.scaleX;
			particle.scaleYAnimator = particle.scaleXAnimator = scaleAnimator;
		}
		else {
			particle.scaleX = calculateValue(scaleXFrom, scaleXFromDelta);
			particle.scaleXDelta = calculateValue(scaleXTo, scaleXToDelta) - particle.scaleX;
			particle.scaleXAnimator = scaleXAnimator;
			particle.scaleY = calculateValue(scaleYFrom, scaleYFromDelta);
			particle.scaleYDelta = calculateValue(scaleYTo, scaleYToDelta) - particle.scaleY;
			particle.scaleYAnimator = scaleYAnimator;
		}
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
