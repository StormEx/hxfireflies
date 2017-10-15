package test.js;

import hxfireflies.particle.IParticleView;
import js.Browser;

class JsMain extends BaseMain {

	override function createParticleView(size:Float = 20):IParticleView {
		return new JsParticleView(size);
	}

	override function createAltParticleView(size:Float = 20):IParticleView {
		return new JsParticleView(size, true);
	}

	override function getTime():Float {
		var d:Date = Date.now();
		return d.getTime();
	}

	override function initialize() {
		Browser.window.requestAnimationFrame(onFrame);
	}

	public function new() {
		super();
	}

	function onFrame(e:Float) {
		JsParticleView.ctx.clearRect(0, 0, 800, 480);
		gameLoop();
		Browser.window.requestAnimationFrame(onFrame);
	}
}
