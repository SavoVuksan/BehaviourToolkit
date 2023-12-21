extends FSMTransition

## Executed when the transition is taken.
func _on_transition(actor: Node, _blackboard: BtkBlackboard):
	actor.alive = true
	actor.age = 1
	actor.set_modulate(Color(1, 1, 1, 1))


## Evaluates true, if the transition conditions are met.
func is_valid(_actor: Node, _blackboard: BtkBlackboard):
	return false
