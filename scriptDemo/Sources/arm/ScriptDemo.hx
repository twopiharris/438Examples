package arm;

import iron.object.Object;
import iron.math.Quat;


class ScriptDemo extends iron.Trait {
	public function new() {
		super();

		// notifyOnInit(function() {
		// });

		notifyOnUpdate(function() {
		  	var keyboard  = iron.system.Input.getKeyboard();
		    if (keyboard.down("w")){
			  	object.transform.loc.y += .1;
			} else if (keyboard.down("s")){
				object.transform.loc.y -= .1;
			} // end if

			if (keyboard.down("a")){
				object.transform.loc.x -= .1;
			} else if (keyboard.down("d")){
				object.transform.loc.x += .1;
			} // end if

                	
			if (keyboard.down("space")){
				var q = new Quat();
				q.fromEuler(0, 0, .1);
				object.transform.rot.mult(q);
			
			}  // end if
			

			object.transform.buildMatrix();
		});

		// notifyOnRemove(function() {
		// });
	}
}
