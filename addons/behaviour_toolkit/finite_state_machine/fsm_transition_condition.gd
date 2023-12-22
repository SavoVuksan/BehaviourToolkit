@icon("../icons/BTLeafCondition.svg")
## This is the base class for the TransitionConditions of the [FsmTransitionV2] class.
## Conditions are used to evaluate if a transition should trigger
class_name FsmTransitionCondition extends Node

signal evaluation_started()

## [color=yellow][b]Warning[/b]:[/color] The result currently does not take the invert bool into account
signal evaluation_finished(result: bool)

## Invert the result of the condition 
@export var invert : bool 

## Override this method in child classes. This gets called by the [FsmTransitionV2] class 
func evaluate_condition(_actor: Node, _blackboard: BtkBlackboard) -> bool:
    return false