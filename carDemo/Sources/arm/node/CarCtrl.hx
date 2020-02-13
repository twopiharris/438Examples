package arm.node;

@:keep class CarCtrl extends armory.logicnode.LogicTree {

	var functionNodes:Map<String, armory.logicnode.FunctionNode>;

	var functionOutputNodes:Map<String, armory.logicnode.FunctionOutputNode>;

	public function new() {
		super();
		this.functionNodes = new Map();
		this.functionOutputNodes = new Map();
		notifyOnAdd(add);
	}

	override public function add() {
		var _RotateObjectAroundAxis = new armory.logicnode.RotateObjectAroundAxisNode(this);
		var _Keyboard_002 = new armory.logicnode.MergedKeyboardNode(this);
		_Keyboard_002.property0 = "Down";
		_Keyboard_002.property1 = "a";
		_Keyboard_002.addOutputs([_RotateObjectAroundAxis]);
		_Keyboard_002.addOutputs([new armory.logicnode.BooleanNode(this, false)]);
		_RotateObjectAroundAxis.addInput(_Keyboard_002, 0);
		_RotateObjectAroundAxis.addInput(new armory.logicnode.ObjectNode(this, ""), 0);
		_RotateObjectAroundAxis.addInput(new armory.logicnode.VectorNode(this, 0.0, 0.0, 1.0), 0);
		_RotateObjectAroundAxis.addInput(new armory.logicnode.FloatNode(this, 0.09999999403953552), 0);
		_RotateObjectAroundAxis.addOutputs([new armory.logicnode.NullNode(this)]);
		var _RotateObjectAroundAxis_001 = new armory.logicnode.RotateObjectAroundAxisNode(this);
		var _Keyboard_003 = new armory.logicnode.MergedKeyboardNode(this);
		_Keyboard_003.property0 = "Down";
		_Keyboard_003.property1 = "d";
		_Keyboard_003.addOutputs([_RotateObjectAroundAxis_001]);
		_Keyboard_003.addOutputs([new armory.logicnode.BooleanNode(this, false)]);
		_RotateObjectAroundAxis_001.addInput(_Keyboard_003, 0);
		_RotateObjectAroundAxis_001.addInput(new armory.logicnode.ObjectNode(this, ""), 0);
		_RotateObjectAroundAxis_001.addInput(new armory.logicnode.VectorNode(this, 0.0, 0.0, 1.0), 0);
		_RotateObjectAroundAxis_001.addInput(new armory.logicnode.FloatNode(this, -0.10000000149011612), 0);
		_RotateObjectAroundAxis_001.addOutputs([new armory.logicnode.NullNode(this)]);
		var _TranslateObject = new armory.logicnode.TranslateObjectNode(this);
		_TranslateObject.addInput(new armory.logicnode.NullNode(this), 0);
		_TranslateObject.addInput(new armory.logicnode.ObjectNode(this, ""), 0);
		_TranslateObject.addInput(new armory.logicnode.VectorNode(this, 0.0, 0.19999998807907104, 0.0), 0);
		_TranslateObject.addInput(new armory.logicnode.BooleanNode(this, true), 0);
		_TranslateObject.addOutputs([new armory.logicnode.NullNode(this)]);
		var _ApplyForce = new armory.logicnode.ApplyForceNode(this);
		var _Keyboard = new armory.logicnode.MergedKeyboardNode(this);
		_Keyboard.property0 = "Down";
		_Keyboard.property1 = "w";
		_Keyboard.addOutputs([_ApplyForce]);
		_Keyboard.addOutputs([new armory.logicnode.BooleanNode(this, false)]);
		_ApplyForce.addInput(_Keyboard, 0);
		_ApplyForce.addInput(new armory.logicnode.ObjectNode(this, ""), 0);
		_ApplyForce.addInput(new armory.logicnode.VectorNode(this, 0.0, 10.0, 0.0), 0);
		_ApplyForce.addInput(new armory.logicnode.BooleanNode(this, true), 0);
		_ApplyForce.addOutputs([new armory.logicnode.NullNode(this)]);
		var _ApplyForce_001 = new armory.logicnode.ApplyForceNode(this);
		var _Keyboard_001 = new armory.logicnode.MergedKeyboardNode(this);
		_Keyboard_001.property0 = "Down";
		_Keyboard_001.property1 = "s";
		_Keyboard_001.addOutputs([_ApplyForce_001]);
		_Keyboard_001.addOutputs([new armory.logicnode.BooleanNode(this, false)]);
		_ApplyForce_001.addInput(_Keyboard_001, 0);
		_ApplyForce_001.addInput(new armory.logicnode.ObjectNode(this, ""), 0);
		_ApplyForce_001.addInput(new armory.logicnode.VectorNode(this, 0.0, -5.0, 0.0), 0);
		_ApplyForce_001.addInput(new armory.logicnode.BooleanNode(this, true), 0);
		_ApplyForce_001.addOutputs([new armory.logicnode.NullNode(this)]);
	}
}