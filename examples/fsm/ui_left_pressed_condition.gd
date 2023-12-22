class_name UiLeftPressedCondition extends FsmTransitionCondition

func evaluate_condition(_actor: Node, _blackboard: BtkBlackboard) -> bool:
    return Input.is_action_pressed("ui_left")

