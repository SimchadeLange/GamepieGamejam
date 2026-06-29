extends State

@export var pathfinding_component: PathfindingComponent

func state_process(_delta: float) -> void:
	pathfinding_component.chase_target()
