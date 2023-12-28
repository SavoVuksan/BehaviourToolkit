@icon("./icons/BlackboardInitializer.svg")
@tool
class_name BtkBlackboardInitializer extends Node

@export var blackboard : BtkBlackboard
@export var init_on_scene_load : bool = true

var fsm_blackboard : BtkBlackboard
var fsm: FiniteStateMachine

func _ready() -> void:
	var parent = get_parent()
	if !(parent is FiniteStateMachine):
		return
	fsm = parent as FiniteStateMachine

	if init_on_scene_load:
		init_blackboard()
	pass # Replace with function body.

## Initializes blackboard with copy of the original blackboard that is defined before runtime
func init_blackboard():
	if blackboard == null:
		return 
	fsm.blackboard = blackboard.duplicate(true)

func _get_configuration_warnings() -> PackedStringArray:
	var warnings = []

	if !(get_parent() is FiniteStateMachine):
		warnings.append("Needs to be child of FiniteStateMachine")
	

	return warnings