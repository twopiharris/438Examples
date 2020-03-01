package arm.node;

@:keep class NodeTree extends armory.logicnode.LogicTree {

	var functionNodes:Map<String, armory.logicnode.FunctionNode>;

	var functionOutputNodes:Map<String, armory.logicnode.FunctionOutputNode>;

	public function new() {
		super();
		name = "NodeTree";
		this.functionNodes = new Map();
		this.functionOutputNodes = new Map();
		notifyOnAdd(add);
	}

	override public function add() {
		var _Keyboard = new armory.logicnode.MergedKeyboardNode(this);
		_Keyboard.property0 = "Started";
		_Keyboard.property1 = "space";
		_Keyboard.addOutputs([new armory.logicnode.NullNode(this)]);
		_Keyboard.addOutputs([new armory.logicnode.BooleanNode(this, false)]);
		var _RotateObject = new armory.logicnode.RotateObjectNode(this);
		_RotateObject.addInput(new armory.logicnode.NullNode(this), 0);
		_RotateObject.addInput(new armory.logicnode.ObjectNode(this, ""), 0);
		_RotateObject.addInput(new armory.logicnode.VectorNode(this, 0.0, 0.0, 0.0), 0);
		_RotateObject.addOutputs([new armory.logicnode.NullNode(this)]);
		var _TranslateObject = new armory.logicnode.TranslateObjectNode(this);
		_TranslateObject.addInput(new armory.logicnode.NullNode(this), 0);
		_TranslateObject.addInput(new armory.logicnode.ObjectNode(this, ""), 0);
		_TranslateObject.addInput(new armory.logicnode.VectorNode(this, 0.0, 0.0, 0.0), 0);
		_TranslateObject.addInput(new armory.logicnode.BooleanNode(this, false), 0);
		_TranslateObject.addOutputs([new armory.logicnode.NullNode(this)]);
	}
}