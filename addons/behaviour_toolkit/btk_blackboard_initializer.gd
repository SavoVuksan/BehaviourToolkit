@icon("./icons/BlackboardInitializer.svg")
@tool
## This node initializes the blackboard of the parent FiniteStatemachine
class_name BtkBlackboardInitializer extends BehaviourToolkit

## This will be the blackboard that is used for initialization
@export var blackboard : BtkBlackboard

## Inits the blackboard on scene load
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