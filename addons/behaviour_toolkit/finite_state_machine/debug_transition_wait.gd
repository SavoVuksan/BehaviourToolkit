class_name DebugTransitionWait extends FSMTransition

@export var time : float = 1

var timer : SceneTreeTimer
# Executed when the transition is taken.
func _on_transition(_actor: Node, _blackboard: Blackboard) -> void:
	timer = null
	pass


# Evaluates true, if the transition conditions are met.
func is_valid(_actor: Node, _blackboard: Blackboard) -> bool:
	if !timer:
		timer = get_tree().create_timer(time)
	return timer.time_left <= 0

