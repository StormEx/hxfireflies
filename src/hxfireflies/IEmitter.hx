package hxfireflies;

import hxfireflies.area.IArea;
import hxdispose.IDisposable;

interface IEmitter extends IDisposable {
	public var x(get, set):Float;
	public var y(get, set):Float;
	public var area(default, set):IArea;

	public var lifetime:Float;
	public var lifeTimeDelta:Float;

	public var xVelocity:Float;
	public var xVelocityDelta:Float;
	public var yVelocity:Float;
	public var yVelocityDelta:Float;

	public var r(default, set):Float;
	public var rDelta(default, set):Float;
	public var g(default, set):Float;
	public var gDelta(default, set):Float;
	public var b(default, set):Float;
	public var bDelta(default, set):Float;
	public var a(default, set):Float;
	public var aDelta(default, set):Float;

	public function update(dt:Float):Void;
}
