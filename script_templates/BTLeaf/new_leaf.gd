extends BTLeaf


# Gets called every tick of the behavior tree
func tick(_actor: Node, _blackboard: BtkBlackboard) -> Status:
    # Handle leaf logic
    # Return SUCCESS, FAILURE, or RUNNING
    return Status.SUCCESS
