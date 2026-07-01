extends State

@export var pathfinding_component: PathfindingComponent
@export var movement_component: MovementComponent
@export var idle_state: State

func on_enter() -> void:
	movement_component.speed_multiplier = 2.0

func state_process(_delta: float) -> void:
	pathfinding_component.chase_target()
	if !Globals.player.health_component:
		next_state = idle_state

func on_exit() -> void:
	movement_component.speed_multiplier = 1.0
