@tool
class_name LastTransitionDebugLabel extends FsmDebugLabel


var _fsm : FiniteStateMachine

func _ready() -> void:
	update_configuration_warnings()
	var parent = _get_parent_recursive(self)
	if parent:
		_fsm = parent as FiniteStateMachine
		_fsm.transitioned.connect(_update_label)
		text = "Last Transition: - - -"

## Updates label text to last transition + state of the State Machine
func _update_label(transition : Node):
	if !transition or !_fsm or !_fsm.active_state:
		return

	text = "Last Transition: " + _fsm.active_state.name + " > " + transition.name

func _get_configuration_warnings() -> PackedStringArray:
	var warnings = []
	var parent = _get_parent_recursive(self)
	if !parent:
		warnings.append("LastTransitionDebugLabel needs FiniteStateMachine as parent!")

	return warnings