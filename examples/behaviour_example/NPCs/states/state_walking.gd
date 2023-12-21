extends FSMState


## Executes after the state is entered.
func _on_enter(actor: Node, _blackboard: BtkBlackboard):
	actor.animation_player.play("RESET")
	actor.animation_player.play("walking")


## Executes every _process call, if the state is active.
func _on_update(_actor: Node, _blackboard: BtkBlackboard):
	pass


## Executes before the state is exited.
func _on_exit(_actor: Node, _blackboard: BtkBlackboard):
	pass
