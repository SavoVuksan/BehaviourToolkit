extends BTLeaf


func tick(actor: Node, _blackboard: BtkBlackboard) -> Status:
	if actor.alive:
		return Status.SUCCESS
	
	return Status.FAILURE

