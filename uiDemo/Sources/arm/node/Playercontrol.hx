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
		var _SetMouseLock = new armory.logicnode.SetMouseLockNode(this);
		var _OnInit = new armory.logicnode.OnInitNode(this);
		_OnInit.addOutputs([_SetMouseLock]);
		_SetMouseLock.addInput(_OnInit, 0);
		_SetMouseLock.addInput(new armory.logicnode.BooleanNode(this, true), 0);
		_SetMouseLock.addOutputs([new armory.logicnode.NullNode(this)]);
		var _Shutdown = new armory.logicnode.ShutdownNode(this);
		var _OnKeyboard_001 = new armory.logicnode.OnKeyboardNode(this);
		_OnKeyboard_001.property0 = "Started";
		_OnKeyboard_001.property1 = "q";
		_OnKeyboard_001.addOutputs([_Shutdown]);
		_Shutdown.addInput(_OnKeyboard_001, 0);
		_Shutdown.addOutputs([new armory.logicnode.NullNode(this)]);
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
		var _Print = new armory.logicnode.PrintNode(this);
		var _SetProperty = new armory.logicnode.SetPropertyNode(this);
		var _OnMouse = new armory.logicnode.OnMouseNode(this);
		_OnMouse.property0 = "Started";
		_OnMouse.property1 = "left";
		var _SpawnObject = new armory.logicnode.SpawnObjectNode(this);
		_SpawnObject.addInput(_OnMouse, 0);
		_SpawnObject.addInput(new armory.logicnode.ObjectNode(this, "bullet"), 0);
		var _GetTransform = new armory.logicnode.GetTransformNode(this);
		_GetTransform.addInput(new armory.logicnode.ObjectNode(this, "gun"), 0);
		_GetTransform.addOutputs([_SpawnObject]);
		_SpawnObject.addInput(_GetTransform, 0);
		_SpawnObject.addInput(new armory.logicnode.BooleanNode(this, true), 0);
		var _ApplyImpulse = new armory.logicnode.ApplyImpulseNode(this);
		_ApplyImpulse.addInput(_SpawnObject, 0);
		_ApplyImpulse.addInput(_SpawnObject, 1);
		_ApplyImpulse.addInput(new armory.logicnode.VectorNode(this, 0.0, 30.0, 0.0), 0);
		_ApplyImpulse.addInput(new armory.logicnode.BooleanNode(this, true), 0);
		var _Sleep = new armory.logicnode.SleepNode(this);
		_Sleep.addInput(_ApplyImpulse, 0);
		_Sleep.addInput(new armory.logicnode.FloatNode(this, 2.0), 0);
		var _RemoveObject = new armory.logicnode.RemoveObjectNode(this);
		_RemoveObject.addInput(_Sleep, 0);
		_RemoveObject.addInput(_SpawnObject, 1);
		_RemoveObject.addOutputs([new armory.logicnode.NullNode(this)]);
		_Sleep.addOutputs([_RemoveObject]);
		_ApplyImpulse.addOutputs([_Sleep]);
		_SpawnObject.addOutputs([_ApplyImpulse]);
		_SpawnObject.addOutputs([_RemoveObject, _ApplyImpulse]);
		var _PlaySpeaker = new armory.logicnode.PlaySoundNode(this);
		_PlaySpeaker.addInput(_OnMouse, 0);
		_PlaySpeaker.addInput(new armory.logicnode.ObjectNode(this, "pew"), 0);
		_PlaySpeaker.addOutputs([new armory.logicnode.NullNode(this)]);
		_OnMouse.addOutputs([_SetProperty, _SpawnObject, _PlaySpeaker]);
		_SetProperty.addInput(_OnMouse, 0);
		_SetProperty.addInput(new armory.logicnode.ObjectNode(this, "gun"), 0);
		_SetProperty.addInput(new armory.logicnode.StringNode(this, "num_clicks"), 0);
		var _Math_002 = new armory.logicnode.MathNode(this);
		_Math_002.property0 = "Add";
		_Math_002.property1 = "false";
		var _GetProperty = new armory.logicnode.GetPropertyNode(this);
		_GetProperty.addInput(new armory.logicnode.ObjectNode(this, "gun"), 0);
		_GetProperty.addInput(new armory.logicnode.StringNode(this, "num_clicks"), 0);
		_GetProperty.addOutputs([_Math_002]);
		_GetProperty.addOutputs([new armory.logicnode.StringNode(this, "")]);
		_Math_002.addInput(_GetProperty, 0);
		_Math_002.addInput(new armory.logicnode.FloatNode(this, 1.0), 0);
		_Math_002.addOutputs([_SetProperty]);
		_SetProperty.addInput(_Math_002, 0);
		var _CanvasSetText = new armory.logicnode.CanvasSetTextNode(this);
		_CanvasSetText.addInput(_SetProperty, 0);
		_CanvasSetText.addInput(new armory.logicnode.StringNode(this, "txtCounter"), 0);
		var _GetProperty_001 = new armory.logicnode.GetPropertyNode(this);
		_GetProperty_001.addInput(new armory.logicnode.ObjectNode(this, "gun"), 0);
		_GetProperty_001.addInput(new armory.logicnode.StringNode(this, "num_clicks"), 0);
		_GetProperty_001.addOutputs([_Print, _CanvasSetText]);
		_GetProperty_001.addOutputs([new armory.logicnode.StringNode(this, "")]);
		_CanvasSetText.addInput(_GetProperty_001, 0);
		_CanvasSetText.addOutputs([new armory.logicnode.NullNode(this)]);
		_SetProperty.addOutputs([_Print, _CanvasSetText]);
		_Print.addInput(_SetProperty, 0);
		_Print.addInput(_GetProperty_001, 0);
		_Print.addOutputs([new armory.logicnode.NullNode(this)]);
	}
}