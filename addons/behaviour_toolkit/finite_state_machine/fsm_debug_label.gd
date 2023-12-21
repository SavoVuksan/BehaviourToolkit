class_name FsmDebugLabel extends Label


## Returns the parent if it is a FiniteStateMachine recursively
func _get_parent_recursive(node: Node):
	if !node.get_parent():
		return null
	var parent = node.get_parent()
	if parent is FiniteStateMachine:
		return parent
	
	return _get_parent_recursive(parent)