package ;

import hxdispose.DisposableArray;
import hxdispose.Dispose;
import hxfireflies.Emitter;

class Main {

	public function new() {
	}

	public static function main() {
		var em:Emitter = new Emitter();
		Dispose.dispose(em);

		var da:DisposableArray<Emitter> = [];
		Dispose.dispose(da);

		trace("fireflies");
	}
}
