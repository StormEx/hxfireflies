package ;

import hxdispose.DisposableArray;
import hxdispose.Dispose;
import hxfireflies.emitter.Emitter;

class Main {
	public function new() {
	}

	public static function main() {
		var em:Emitter = new Emitter();
		Dispose.dispose(em);

		var da:DisposableArray<Emitter> = [];
		Dispose.dispose(da);

#if flash
		new dl.DLMain();
#end

		trace("fireflies");
	}
}
