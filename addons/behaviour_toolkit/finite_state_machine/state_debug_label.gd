@tool
class_name StateDebugLabel extends FsmDebugLabel


var _fsm : FiniteStateMachine

func _ready() -> void:
	update_configuration_warnings()
	var parent = _get_parent_recursive(self)
	if parent:
		_fsm = parent as FiniteStateMachine
		_fsm.state_changed.connect(_update_label)
		_update_label(null)

## Updates label text to current state of the State Machine
func _update_label(_state : FSMState):
	if !_fsm or !_fsm.active_state:
		return

	text = "Current State: 	" + _fsm.active_state.name

func _get_configuration_warnings() -> PackedStringArray:
	var warnings = []
	var parent = _get_parent_recursive(self)
	if !parent:
		warnings.append("StateDebugLabel needs FiniteStateMachine as parent!")

	return warnings
