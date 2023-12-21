extends FSMTransition

## Executed when the transition is taken.
func _on_transition(_actor: Node, _blackboard: BtkBlackboard):
	pass


## Evaluates true, if the transition conditions are met.
func is_valid(_actor: Node, _blackboard: BtkBlackboard):
	return false

