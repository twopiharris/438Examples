package arm.node;

@:keep class Ballcollide extends armory.logicnode.LogicTree {

	var functionNodes:Map<String, armory.logicnode.FunctionNode>;

	var functionOutputNodes:Map<String, armory.logicnode.FunctionOutputNode>;

	public function new() {
		super();
		this.functionNodes = new Map();
		this.functionOutputNodes = new Map();
		notifyOnAdd(add);
	}

	override public function add() {
		var _SetTransform_001 = new armory.logicnode.SetTransformNode(this);
		var _Keyboard = new armory.logicnode.MergedKeyboardNode(this);
		_Keyboard.property0 = "Started";
		_Keyboard.property1 = "r";
		_Keyboard.addOutputs([_SetTransform_001]);
		_Keyboard.addOutputs([new armory.logicnode.BooleanNode(this, false)]);
		_SetTransform_001.addInput(_Keyboard, 0);
		_SetTransform_001.addInput(new armory.logicnode.ObjectNode(this, "ball"), 0);
		var _Transform_001 = new armory.logicnode.TransformNode(this);
		_Transform_001.addInput(new armory.logicnode.VectorNode(this, 0.0, 0.0, 0.0), 0);
		_Transform_001.addInput(new armory.logicnode.VectorNode(this, 0.0, 0.0, 0.0), 0);
		_Transform_001.addInput(new armory.logicnode.VectorNode(this, 1.0, 1.0, 1.0), 0);
		_Transform_001.addOutputs([_SetTransform_001]);
		_SetTransform_001.addInput(_Transform_001, 0);
		_SetTransform_001.addOutputs([new armory.logicnode.NullNode(this)]);
		var _SetTransform = new armory.logicnode.SetTransformNode(this);
		var _OnVolumeTrigger = new armory.logicnode.OnVolumeTriggerNode(this);
		_OnVolumeTrigger.property0 = "Enter";
		_OnVolumeTrigger.addInput(new armory.logicnode.ObjectNode(this, "car"), 0);
		_OnVolumeTrigger.addInput(new armory.logicnode.ObjectNode(this, ""), 0);
		_OnVolumeTrigger.addOutputs([_SetTransform]);
		_SetTransform.addInput(_OnVolumeTrigger, 0);
		_SetTransform.addInput(new armory.logicnode.ObjectNode(this, "ball"), 0);
		var _Transform = new armory.logicnode.TransformNode(this);
		var _Vector = new armory.logicnode.VectorNode(this);
		var _Random_Float_ = new armory.logicnode.RandomFloatNode(this);
		_Random_Float_.addInput(new armory.logicnode.FloatNode(this, -10.0), 0);
		_Random_Float_.addInput(new armory.logicnode.FloatNode(this, 10.0), 0);
		_Random_Float_.addOutputs([_Vector]);
		_Vector.addInput(_Random_Float_, 0);
		var _Random_Float__001 = new armory.logicnode.RandomFloatNode(this);
		_Random_Float__001.addInput(new armory.logicnode.FloatNode(this, -5.0), 0);
		_Random_Float__001.addInput(new armory.logicnode.FloatNode(this, 5.0), 0);
		_Random_Float__001.addOutputs([_Vector]);
		_Vector.addInput(_Random_Float__001, 0);
		_Vector.addInput(new armory.logicnode.FloatNode(this, 0.0), 0);
		_Vector.addOutputs([_Transform]);
		_Transform.addInput(_Vector, 0);
		_Transform.addInput(new armory.logicnode.VectorNode(this, 0.0, 0.0, 0.0), 0);
		_Transform.addInput(new armory.logicnode.VectorNode(this, 1.0, 1.0, 1.0), 0);
		_Transform.addOutputs([_SetTransform]);
		_SetTransform.addInput(_Transform, 0);
		_SetTransform.addOutputs([new armory.logicnode.NullNode(this)]);
		var _RotateObjectAroundAxis = new armory.logicnode.RotateObjectAroundAxisNode(this);
		var _OnUpdate = new armory.logicnode.OnUpdateNode(this);
		_OnUpdate.property0 = "Update";
		_OnUpdate.addOutputs([_RotateObjectAroundAxis]);
		_RotateObjectAroundAxis.addInput(_OnUpdate, 0);
		_RotateObjectAroundAxis.addInput(new armory.logicnode.ObjectNode(this, ""), 0);
		_RotateObjectAroundAxis.addInput(new armory.logicnode.VectorNode(this, 0.0, 0.0, 1.0), 0);
		_RotateObjectAroundAxis.addInput(new armory.logicnode.FloatNode(this, 0.009999999776482582), 0);
		_RotateObjectAroundAxis.addOutputs([new armory.logicnode.NullNode(this)]);
	}
}