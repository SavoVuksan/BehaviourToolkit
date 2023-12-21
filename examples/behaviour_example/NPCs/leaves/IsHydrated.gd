extends BTLeaf


func tick(actor: Node, _blackboard: BtkBlackboard) -> Status:
	if actor.thirst == 0:
		return Status.FAILURE
	
	return Status.SUCCESS
