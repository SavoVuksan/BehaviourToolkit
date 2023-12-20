@tool
class_name StateDebugLabel extends Label


var _fsm : FiniteStateMachine

func _ready() -> void:
	update_configuration_warnings()
	if get_parent() is FiniteStateMachine:
		_fsm = get_parent() as FiniteStateMachine
		_fsm.state_changed.connect(_update_state)
		_update_state(null)

## Updates label text to current state of the State Machine
func _update_state(_state : FSMState):
	if !_fsm or !_fsm.active_state:
		return

	text = _fsm.active_state.name

func _get_configuration_warnings() -> PackedStringArray:
	var warnings = []
	if !get_parent() is FiniteStateMachine:
		warnings.append("StateDebugLabel needs FiniteStateMachine as parent!")

	return warnings