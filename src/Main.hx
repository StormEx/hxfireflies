package ;

class Main {
	public function new() {
	}

	public static function main() {
#if flash
		new test.dl.DLMain();
#elseif js
		new test.js.JsMain();
#end

		trace("fireflies");
	}
}
