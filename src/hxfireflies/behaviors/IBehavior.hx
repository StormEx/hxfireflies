package hxfireflies.behaviors;

import hxdispose.IDisposable;

interface IBehavior extends IDisposable {
    public var isActive(get, never):Bool;

    public function activate():Void;
}
