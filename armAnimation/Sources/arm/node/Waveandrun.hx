package arm.node;

@:keep class Waveandrun extends armory.logicnode.LogicTree {

	var functionNodes:Map<String, armory.logicnode.FunctionNode>;

	var functionOutputNodes:Map<String, armory.logicnode.FunctionOutputNode>;

	public function new() {
		super();
		name = "Waveandrun";
		this.functionNodes = new Map();
		this.functionOutputNodes = new Map();
		notifyOnAdd(add);
	}

	override public function add() {
		var _PauseAction = new armory.logicnode.PauseActionNode(this);
		var _OnInit = new armory.logicnode.OnInitNode(this);
		_OnInit.addOutputs([_PauseAction]);
		_PauseAction.addInput(_OnInit, 0);
		_PauseAction.addInput(new armory.logicnode.ObjectNode(this, "human"), 0);
		_PauseAction.addOutputs([new armory.logicnode.NullNode(this)]);
		var _PauseAction_001 = new armory.logicnode.PauseActionNode(this);
		var _PlayAction = new armory.logicnode.PlayActionNode(this);
		var _OnKeyboard = new armory.logicnode.OnKeyboardNode(this);
		_OnKeyboard.property0 = "Started";
		_OnKeyboard.property1 = "l";
		_OnKeyboard.addOutputs([_PlayAction]);
		_PlayAction.addInput(_OnKeyboard, 0);
		_PlayAction.addInput(new armory.logicnode.ObjectNode(this, "human"), 0);
		_PlayAction.addInput(new armory.logicnode.StringNode(this, "wave left"), 0);
		_PlayAction.addInput(new armory.logicnode.FloatNode(this, 0.20000000298023224), 0);
		_PlayAction.addOutputs([new armory.logicnode.NullNode(this)]);
		_PlayAction.addOutputs([_PauseAction_001]);
		_PauseAction_001.addInput(_PlayAction, 1);
		_PauseAction_001.addInput(new armory.logicnode.ObjectNode(this, "human"), 0);
		_PauseAction_001.addOutputs([new armory.logicnode.NullNode(this)]);
		var _PauseAction_002 = new armory.logicnode.PauseActionNode(this);
		var _PlayAction_001 = new armory.logicnode.PlayActionNode(this);
		var _OnKeyboard_001 = new armory.logicnode.OnKeyboardNode(this);
		_OnKeyboard_001.property0 = "Started";
		_OnKeyboard_001.property1 = "r";
		_OnKeyboard_001.addOutputs([_PlayAction_001]);
		_PlayAction_001.addInput(_OnKeyboard_001, 0);
		_PlayAction_001.addInput(new armory.logicnode.ObjectNode(this, "human"), 0);
		_PlayAction_001.addInput(new armory.logicnode.StringNode(this, "wave right"), 0);
		_PlayAction_001.addInput(new armory.logicnode.FloatNode(this, 0.20000000298023224), 0);
		_PlayAction_001.addOutputs([new armory.logicnode.NullNode(this)]);
		_PlayAction_001.addOutputs([_PauseAction_002]);
		_PauseAction_002.addInput(_PlayAction_001, 1);
		_PauseAction_002.addInput(new armory.logicnode.ObjectNode(this, "human"), 0);
		_PauseAction_002.addOutputs([new armory.logicnode.NullNode(this)]);
		var _PlayAction_002 = new armory.logicnode.PlayActionNode(this);
		var _OnKeyboard_002 = new armory.logicnode.OnKeyboardNode(this);
		_OnKeyboard_002.property0 = "Started";
		_OnKeyboard_002.property1 = "w";
		_OnKeyboard_002.addOutputs([_PlayAction_002]);
		_PlayAction_002.addInput(_OnKeyboard_002, 0);
		_PlayAction_002.addInput(new armory.logicnode.ObjectNode(this, "human"), 0);
		_PlayAction_002.addInput(new armory.logicnode.StringNode(this, "run"), 0);
		_PlayAction_002.addInput(new armory.logicnode.FloatNode(this, 0.20000000298023224), 0);
		_PlayAction_002.addOutputs([new armory.logicnode.NullNode(this)]);
		_PlayAction_002.addOutputs([new armory.logicnode.NullNode(this)]);
		var _PauseAction_003 = new armory.logicnode.PauseActionNode(this);
		var _OnKeyboard_003 = new armory.logicnode.OnKeyboardNode(this);
		_OnKeyboard_003.property0 = "Released";
		_OnKeyboard_003.property1 = "w";
		_OnKeyboard_003.addOutputs([_PauseAction_003]);
		_PauseAction_003.addInput(_OnKeyboard_003, 0);
		_PauseAction_003.addInput(new armory.logicnode.ObjectNode(this, "human"), 0);
		_PauseAction_003.addOutputs([new armory.logicnode.NullNode(this)]);
		var _RotateObject = new armory.logicnode.RotateObjectNode(this);
		var _Keyboard = new armory.logicnode.MergedKeyboardNode(this);
		_Keyboard.property0 = "Down";
		_Keyboard.property1 = "a";
		_Keyboard.addOutputs([_RotateObject]);
		_Keyboard.addOutputs([new armory.logicnode.BooleanNode(this, false)]);
		_RotateObject.addInput(_Keyboard, 0);
		_RotateObject.addInput(new armory.logicnode.ObjectNode(this, ""), 0);
		_RotateObject.addInput(new armory.logicnode.VectorNode(this, 0.0, 0.0, 0.10000000149011612), 0);
		_RotateObject.addOutputs([new armory.logicnode.NullNode(this)]);
		var _RotateObject_001 = new armory.logicnode.RotateObjectNode(this);
		var _Keyboard_001 = new armory.logicnode.MergedKeyboardNode(this);
		_Keyboard_001.property0 = "Down";
		_Keyboard_001.property1 = "d";
		_Keyboard_001.addOutputs([_RotateObject_001]);
		_Keyboard_001.addOutputs([new armory.logicnode.BooleanNode(this, false)]);
		_RotateObject_001.addInput(_Keyboard_001, 0);
		_RotateObject_001.addInput(new armory.logicnode.ObjectNode(this, ""), 0);
		_RotateObject_001.addInput(new armory.logicnode.VectorNode(this, 0.0, 0.0, -0.09999999403953552), 0);
		_RotateObject_001.addOutputs([new armory.logicnode.NullNode(this)]);
		var _TranslateObject = new armory.logicnode.TranslateObjectNode(this);
		var _OnKeyboard_004 = new armory.logicnode.OnKeyboardNode(this);
		_OnKeyboard_004.property0 = "Down";
		_OnKeyboard_004.property1 = "w";
		_OnKeyboard_004.addOutputs([_TranslateObject]);
		_TranslateObject.addInput(_OnKeyboard_004, 0);
		_TranslateObject.addInput(new armory.logicnode.ObjectNode(this, ""), 0);
		_TranslateObject.addInput(new armory.logicnode.VectorNode(this, 0.0, -0.10000000149011612, 0.0), 0);
		_TranslateObject.addInput(new armory.logicnode.BooleanNode(this, true), 0);
		_TranslateObject.addOutputs([new armory.logicnode.NullNode(this)]);
	}
}