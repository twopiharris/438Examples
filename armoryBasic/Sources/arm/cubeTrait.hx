package arm;

class cubeTrait extends iron.Trait {
	public function new() {
		super();

		// notifyOnInit(function() {
		// });

		notifyOnUpdate(function() {
		  var mouse = iron.system.Input.getMouse();
		});

		// notifyOnRemove(function() {
		// });
	}
}
