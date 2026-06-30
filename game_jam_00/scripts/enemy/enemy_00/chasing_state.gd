extends State

@export var pathfinding_component: PathfindingComponent
@export var movement_component: MovementComponent

func on_enter() -> void:
	movement_component.speed_multiplier = 1.75

func state_process(_delta: float) -> void:
	pathfinding_component.chase_target()

func on_exit() -> void:
	movement_component.speed_multiplier = 1.0
