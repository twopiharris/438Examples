package arm.node;

@:keep class Playercontrol extends armory.logicnode.LogicTree {

	var functionNodes:Map<String, armory.logicnode.FunctionNode>;

	var functionOutputNodes:Map<String, armory.logicnode.FunctionOutputNode>;

	public function new() {
		super();
		this.functionNodes = new Map();
		this.functionOutputNodes = new Map();
		notifyOnAdd(add);
	}

	override public function add() {
		var _RotateObject_001 = new armory.logicnode.RotateObjectNode(this);
		var _OnUpdate = new armory.logicnode.OnUpdateNode(this);
		_OnUpdate.property0 = "Update";
		var _RotateObject = new armory.logicnode.RotateObjectNode(this);
		_RotateObject.addInput(_OnUpdate, 0);
		_RotateObject.addInput(new armory.logicnode.ObjectNode(this, "body"), 0);
		var _Vector = new armory.logicnode.VectorNode(this);
		_Vector.addInput(new armory.logicnode.FloatNode(this, 0.0), 0);
		_Vector.addInput(new armory.logicnode.FloatNode(this, 0.0), 0);
		var _Math = new armory.logicnode.MathNode(this);
		_Math.property0 = "Multiply";
		_Math.property1 = "false";
		var _SeparateXYZ = new armory.logicnode.SeparateVectorNode(this);
		var _MouseCoords = new armory.logicnode.MouseCoordsNode(this);
		_MouseCoords.addOutputs([new armory.logicnode.VectorNode(this, 0.0, 0.0, 0.0)]);
		_MouseCoords.addOutputs([_SeparateXYZ]);
		_MouseCoords.addOutputs([new armory.logicnode.IntegerNode(this, 0)]);
		_SeparateXYZ.addInput(_MouseCoords, 1);
		_SeparateXYZ.addOutputs([_Math]);
		var _Math_001 = new armory.logicnode.MathNode(this);
		_Math_001.property0 = "Multiply";
		_Math_001.property1 = "false";
		_Math_001.addInput(_SeparateXYZ, 1);
		_Math_001.addInput(new armory.logicnode.FloatNode(this, -0.0010000000474974513), 0);
		var _Vector_001 = new armory.logicnode.VectorNode(this);
		_Vector_001.addInput(_Math_001, 0);
		_Vector_001.addInput(new armory.logicnode.FloatNode(this, 0.0), 0);
		_Vector_001.addInput(new armory.logicnode.FloatNode(this, 0.0), 0);
		_Vector_001.addOutputs([_RotateObject_001]);
		_Math_001.addOutputs([_Vector_001]);
		_SeparateXYZ.addOutputs([_Math_001]);
		_SeparateXYZ.addOutputs([new armory.logicnode.FloatNode(this, 0.0)]);
		_Math.addInput(_SeparateXYZ, 0);
		_Math.addInput(new armory.logicnode.FloatNode(this, -0.0010000000474974513), 0);
		_Math.addOutputs([_Vector]);
		_Vector.addInput(_Math, 0);
		_Vector.addOutputs([_RotateObject]);
		_RotateObject.addInput(_Vector, 0);
		_RotateObject.addOutputs([new armory.logicnode.NullNode(this)]);
		_OnUpdate.addOutputs([_RotateObject, _RotateObject_001]);
		_RotateObject_001.addInput(_OnUpdate, 0);
		_RotateObject_001.addInput(new armory.logicnode.ObjectNode(this, "head"), 0);
		_RotateObject_001.addInput(_Vector_001, 0);
		_RotateObject_001.addOutputs([new armory.logicnode.NullNode(this)]);
		var _TranslateObject = new armory.logicnode.TranslateObjectNode(this);
		var _OnKeyboard = new armory.logicnode.OnKeyboardNode(this);
		_OnKeyboard.property0 = "Down";
		_OnKeyboard.property1 = "w";
		_OnKeyboard.addOutputs([_TranslateObject]);
		_TranslateObject.addInput(_OnKeyboard, 0);
		_TranslateObject.addInput(new armory.logicnode.ObjectNode(this, "body"), 0);
		_TranslateObject.addInput(new armory.logicnode.VectorNode(this, 0.0, 0.19999998807907104, 0.0), 0);
		_TranslateObject.addInput(new armory.logicnode.BooleanNode(this, true), 0);
		_TranslateObject.addOutputs([new armory.logicnode.NullNode(this)]);
		var _Shutdown = new armory.logicnode.ShutdownNode(this);
		var _OnKeyboard_001 = new armory.logicnode.OnKeyboardNode(this);
		_OnKeyboard_001.property0 = "Started";
		_OnKeyboard_001.property1 = "q";
		_OnKeyboard_001.addOutputs([_Shutdown]);
		_Shutdown.addInput(_OnKeyboard_001, 0);
		_Shutdown.addOutputs([new armory.logicnode.NullNode(this)]);
		var _SetMouseLock = new armory.logicnode.SetMouseLockNode(this);
		var _OnInit = new armory.logicnode.OnInitNode(this);
		_OnInit.addOutputs([_SetMouseLock]);
		_SetMouseLock.addInput(_OnInit, 0);
		_SetMouseLock.addInput(new armory.logicnode.BooleanNode(this, true), 0);
		_SetMouseLock.addOutputs([new armory.logicnode.NullNode(this)]);
	}
}