## This class is an alternative implementation of the Transition. This implementation takes an array of [FsmTransitionCondition] that need to be met 
## for the transition to happen. All conditions need to be true for the transition to trigger. The conditions need to be child nodes of
## the transition to work
@icon("res://addons/behaviour_toolkit/icons/FSMTransition.svg")
@tool
class_name FsmTransitionV2 extends Node

@export var next_state : FSMState

func _ready() -> void:
	update_configuration_warnings()
	child_order_changed.connect(update_configuration_warnings)

## Evaluates all child []conditions. Currently all conditions need to be true for the transition to trigger
func evaluate_conditions(actor: Node, blackboard: BtkBlackboard):
	var succeeded = false

	for cond in _get_conditions():
		cond = cond as FsmTransitionCondition
		cond.evaluation_started.emit()
		succeeded = cond.evaluate_condition(actor, blackboard) != cond.invert
		cond.evaluation_finished.emit(succeeded)

		if !succeeded:
			return succeeded

	return succeeded

## Executed when the transition is taken.
func _on_transition(_actor: Node, _blackboard: BtkBlackboard) -> void:
	pass

## Evaluates true, if the transition conditions are met.
func is_valid(_actor: Node, _blackboard: BtkBlackboard) -> bool:
	return evaluate_conditions(_actor, _blackboard)

## Returns which state to transition to, when valid.
func get_next_state() -> FSMState:
	return next_state

func is_valid_event(current_event: String) -> bool:
	if current_event == "":
		return false
	
	return false

func _get_conditions() -> Array:
	var conditions : Array = []
	for child in get_children():
		if child is FsmTransitionCondition:
			conditions.append(child)

	return conditions

func _get_configuration_warnings() -> PackedStringArray:
	var warnings = []

	if _get_conditions().size() == 0:
		warnings.append("Needs at least 1 Child Condition to work")
	
	return warnings
