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
		_RotateObject.addInput(new armory.logicnode.ObjectNode(this, "player"), 0);
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
		_Math_001.addInput(new armory.logicnode.FloatNode(this, -0.009999999776482582), 0);
		var _Vector_001 = new armory.logicnode.VectorNode(this);
		_Vector_001.addInput(_Math_001, 0);
		_Vector_001.addInput(new armory.logicnode.FloatNode(this, 0.0), 0);
		_Vector_001.addInput(new armory.logicnode.FloatNode(this, 0.0), 0);
		_Vector_001.addOutputs([_RotateObject_001]);
		_Math_001.addOutputs([_Vector_001]);
		_SeparateXYZ.addOutputs([_Math_001]);
		_SeparateXYZ.addOutputs([new armory.logicnode.FloatNode(this, 0.0)]);
		_Math.addInput(_SeparateXYZ, 0);
		_Math.addInput(new armory.logicnode.FloatNode(this, -0.009999999776482582), 0);
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
		var _Shutdown = new armory.logicnode.ShutdownNode(this);
		var _Keyboard_001 = new armory.logicnode.MergedKeyboardNode(this);
		_Keyboard_001.property0 = "Down";
		_Keyboard_001.property1 = "q";
		_Keyboard_001.addOutputs([_Shutdown]);
		_Keyboard_001.addOutputs([new armory.logicnode.BooleanNode(this, false)]);
		_Shutdown.addInput(_Keyboard_001, 0);
		_Shutdown.addOutputs([new armory.logicnode.NullNode(this)]);
		var _TranslateObject_001 = new armory.logicnode.TranslateObjectNode(this);
		var _Keyboard_003 = new armory.logicnode.MergedKeyboardNode(this);
		_Keyboard_003.property0 = "Down";
		_Keyboard_003.property1 = "s";
		_Keyboard_003.addOutputs([_TranslateObject_001]);
		_Keyboard_003.addOutputs([new armory.logicnode.BooleanNode(this, false)]);
		_TranslateObject_001.addInput(_Keyboard_003, 0);
		_TranslateObject_001.addInput(new armory.logicnode.ObjectNode(this, "player"), 0);
		_TranslateObject_001.addInput(new armory.logicnode.VectorNode(this, 0.0, -0.20000000298023224, -3.725290298461914e-09), 0);
		_TranslateObject_001.addInput(new armory.logicnode.BooleanNode(this, true), 0);
		_TranslateObject_001.addOutputs([new armory.logicnode.NullNode(this)]);
		var _TranslateObject = new armory.logicnode.TranslateObjectNode(this);
		var _Keyboard = new armory.logicnode.MergedKeyboardNode(this);
		_Keyboard.property0 = "Down";
		_Keyboard.property1 = "w";
		_Keyboard.addOutputs([_TranslateObject]);
		_Keyboard.addOutputs([new armory.logicnode.BooleanNode(this, false)]);
		_TranslateObject.addInput(_Keyboard, 0);
		_TranslateObject.addInput(new armory.logicnode.ObjectNode(this, "player"), 0);
		_TranslateObject.addInput(new armory.logicnode.VectorNode(this, 0.0, 0.19999998807907104, -3.725290298461914e-09), 0);
		_TranslateObject.addInput(new armory.logicnode.BooleanNode(this, true), 0);
		_TranslateObject.addOutputs([new armory.logicnode.NullNode(this)]);
		var _PlaySound = new armory.logicnode.PlaySoundRawNode(this);
		_PlaySound.property0 = "Pew_Pew-DKnight556-1379997159 (1).wav";
		var _Mouse = new armory.logicnode.MergedMouseNode(this);
		_Mouse.property0 = "Started";
		_Mouse.property1 = "left";
		var _SpawnObject = new armory.logicnode.SpawnObjectNode(this);
		_SpawnObject.addInput(_Mouse, 0);
		_SpawnObject.addInput(new armory.logicnode.ObjectNode(this, "bullet"), 0);
		var _GetTransform = new armory.logicnode.GetTransformNode(this);
		_GetTransform.addInput(new armory.logicnode.ObjectNode(this, "gun"), 0);
		_GetTransform.addOutputs([_SpawnObject]);
		_SpawnObject.addInput(_GetTransform, 0);
		_SpawnObject.addInput(new armory.logicnode.BooleanNode(this, true), 0);
		var _ApplyImpulse = new armory.logicnode.ApplyImpulseNode(this);
		_ApplyImpulse.addInput(_SpawnObject, 0);
		_ApplyImpulse.addInput(_SpawnObject, 1);
		_ApplyImpulse.addInput(new armory.logicnode.VectorNode(this, 0.0, 100.0, 0.0), 0);
		_ApplyImpulse.addInput(new armory.logicnode.BooleanNode(this, true), 0);
		_ApplyImpulse.addOutputs([new armory.logicnode.NullNode(this)]);
		_SpawnObject.addOutputs([_ApplyImpulse]);
		_SpawnObject.addOutputs([_ApplyImpulse]);
		_Mouse.addOutputs([_SpawnObject, _PlaySound]);
		_Mouse.addOutputs([new armory.logicnode.BooleanNode(this, false)]);
		_PlaySound.addInput(_Mouse, 0);
		_PlaySound.addOutputs([new armory.logicnode.NullNode(this)]);
	}
}