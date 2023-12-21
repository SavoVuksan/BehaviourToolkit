@icon("res://addons/behaviour_toolkit/icons/BTDecoratorRepeat.svg")
class_name BTRepeat extends BTDecorator
## Repeats the leaf a number of times.


@export var repetition: int = 1
@export var on_limit: Status = Status.FAILURE


@onready var cache_key = 'repeat_%s' % self.get_instance_id()


func tick(actor: Node, blackboard: BtkBlackboard):
	var current_count = blackboard.get_value(cache_key)
	if current_count == null:
		current_count = 0
	
	if current_count <= repetition:
		var response = leaf.tick(actor, blackboard)

		if response == Status.RUNNING:
			return response

		if response == Status.SUCCESS:
			current_count += 1
			blackboard.set_value(cache_key, current_count)
			return Status.RUNNING
		else:
			return response
	else:
		blackboard.set_value(cache_key, 0)
		return on_limit
