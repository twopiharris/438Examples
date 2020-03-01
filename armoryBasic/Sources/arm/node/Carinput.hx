package arm.node;

@:keep class Carinput extends armory.logicnode.LogicTree {

	var functionNodes:Map<String, armory.logicnode.FunctionNode>;

	var functionOutputNodes:Map<String, armory.logicnode.FunctionOutputNode>;

	public function new() {
		super();
		this.functionNodes = new Map();
		this.functionOutputNodes = new Map();
		notifyOnAdd(add);
	}

	override public function add() {
		var _RotateObjectAroundAxis_001 = new armory.logicnode.RotateObjectAroundAxisNode(this);
		var _Keyboard_003 = new armory.logicnode.MergedKeyboardNode(this);
		_Keyboard_003.property0 = "Down";
		_Keyboard_003.property1 = "right";
		_Keyboard_003.addOutputs([_RotateObjectAroundAxis_001]);
		_Keyboard_003.addOutputs([new armory.logicnode.BooleanNode(this, false)]);
		_RotateObjectAroundAxis_001.addInput(_Keyboard_003, 0);
		_RotateObjectAroundAxis_001.addInput(new armory.logicnode.ObjectNode(this, ""), 0);
		_RotateObjectAroundAxis_001.addInput(new armory.logicnode.VectorNode(this, 0.0, 0.0, 1.0), 0);
		_RotateObjectAroundAxis_001.addInput(new armory.logicnode.FloatNode(this, -0.10000000149011612), 0);
		_RotateObjectAroundAxis_001.addOutputs([new armory.logicnode.NullNode(this)]);
		var _RotateObjectAroundAxis = new armory.logicnode.RotateObjectAroundAxisNode(this);
		var _Keyboard_002 = new armory.logicnode.MergedKeyboardNode(this);
		_Keyboard_002.property0 = "Down";
		_Keyboard_002.property1 = "left";
		_Keyboard_002.addOutputs([_RotateObjectAroundAxis]);
		_Keyboard_002.addOutputs([new armory.logicnode.BooleanNode(this, false)]);
		_RotateObjectAroundAxis.addInput(_Keyboard_002, 0);
		_RotateObjectAroundAxis.addInput(new armory.logicnode.ObjectNode(this, ""), 0);
		_RotateObjectAroundAxis.addInput(new armory.logicnode.VectorNode(this, 0.0, 0.0, 1.0), 0);
		_RotateObjectAroundAxis.addInput(new armory.logicnode.FloatNode(this, 0.10000000149011612), 0);
		_RotateObjectAroundAxis.addOutputs([new armory.logicnode.NullNode(this)]);
		var _TranslateObject = new armory.logicnode.TranslateObjectNode(this);
		var _Keyboard = new armory.logicnode.MergedKeyboardNode(this);
		_Keyboard.property0 = "Down";
		_Keyboard.property1 = "up";
		_Keyboard.addOutputs([_TranslateObject]);
		_Keyboard.addOutputs([new armory.logicnode.BooleanNode(this, false)]);
		_TranslateObject.addInput(_Keyboard, 0);
		_TranslateObject.addInput(new armory.logicnode.ObjectNode(this, ""), 0);
		_TranslateObject.addInput(new armory.logicnode.VectorNode(this, 0.0, 0.19999998807907104, 0.0), 0);
		_TranslateObject.addInput(new armory.logicnode.BooleanNode(this, true), 0);
		_TranslateObject.addOutputs([new armory.logicnode.NullNode(this)]);
		var _TranslateObject_001 = new armory.logicnode.TranslateObjectNode(this);
		var _Keyboard_001 = new armory.logicnode.MergedKeyboardNode(this);
		_Keyboard_001.property0 = "Down";
		_Keyboard_001.property1 = "down";
		_Keyboard_001.addOutputs([_TranslateObject_001]);
		_Keyboard_001.addOutputs([new armory.logicnode.BooleanNode(this, false)]);
		_TranslateObject_001.addInput(_Keyboard_001, 0);
		_TranslateObject_001.addInput(new armory.logicnode.ObjectNode(this, ""), 0);
		_TranslateObject_001.addInput(new armory.logicnode.VectorNode(this, 0.0, -0.10000000149011612, 0.0), 0);
		_TranslateObject_001.addInput(new armory.logicnode.BooleanNode(this, true), 0);
		_TranslateObject_001.addOutputs([new armory.logicnode.NullNode(this)]);
	}
}