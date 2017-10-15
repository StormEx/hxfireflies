package hxfireflies.behaviors;

import hxdispose.Dispose;
import hxfireflies.particle.IParticle;

class Behavior implements IBehavior {
    public var isActive(get, never):Bool;

    var _particle:IParticle;
    var _callback:Void->Void;

    public function new(particle:IParticle = null, callback:Void->Void = null) {
        _particle = particle;
        _callback = callback;
    }

    public function dispose() {
        Dispose.dispose(_particle);
        _callback = null;
    }

    public function activate() {
        if(_particle != null) {
        }
    }

    function get_isActive():Bool {
        return _particle != null && _particle.isLife;
    }
}
