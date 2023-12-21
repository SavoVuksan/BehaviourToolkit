@icon("res://addons/behaviour_toolkit/icons/FSMTransition.svg")
class_name FsmTransitionV2 extends Node

@export var next_state : FSMState
@export var conditions : Array[FsmTransitionCondition]

func evaluate_conditions(actor: Node, blackboard: BtkBlackboard):
	var succeeded = true
	for cond in conditions:
		if !cond.condition:
			succeeded = false
			return
		var expression : Expression = Expression.new()
		print(cond.condition)
		var error = expression.parse(cond.condition, ["actor", "blackboard", "Input"])
		if error != OK:
			succeeded = false
			return
		
		succeeded = expression.execute([actor, blackboard, Input],self) != cond.invert
	
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