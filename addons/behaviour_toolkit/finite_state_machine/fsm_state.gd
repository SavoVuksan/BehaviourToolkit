@icon("res://addons/behaviour_toolkit/icons/FSMState.svg")
class_name FSMState extends BehaviourToolkit
signal entered
signal exited
signal interrupted
## A state in a [FiniteStateMachine].


## List of transitions from this state.
var transitions: Array[Node] = []


func _ready() -> void:
	for transition in get_children():
		if transition is FSMTransition or transition is FsmTransitionV2:
			transitions.append(transition)


## Executes after the state is entered.
func _on_enter(_actor: Node, _blackboard: BtkBlackboard) -> void:
	pass


## Executes every process call, if the state is active.
func _on_update(_actor: Node, _blackboard: BtkBlackboard) -> void:
	pass


## Executes before the state is exited.
func _on_exit(_actor: Node, _blackboard: BtkBlackboard) -> void:
	pass

## Executes when the state is interrupted. Use this for cleanup
func _on_interrupt(_actor: Node, _blackboard: BtkBlackboard) -> void:
	pass