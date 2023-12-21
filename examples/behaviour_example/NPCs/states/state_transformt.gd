extends FSMState


## Executes after the state is entered.
func _on_enter(actor: Node, _blackboard: BtkBlackboard):
	# Make Transparent
	actor.set_modulate(Color(1, 1, 1, 0.5))
	actor.ghost_state_machine.fire_event("fully_transformed")


## Executes every _process call, if the state is active.
func _on_update(_actor: Node, _blackboard: BtkBlackboard):
	pass


## Executes before the state is exited.
func _on_exit(_actor: Node, _blackboard: BtkBlackboard):
	pass
