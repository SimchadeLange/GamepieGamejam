extends State

@export var pathfinding_component: PathfindingComponent
@export var movement_component: MovementComponent
@export var idle_state: State

func on_enter() -> void:
	movement_component.speed_multiplier = 1.75
	pathfinding_component.target = get_nearest_guard()

func state_process(_delta: float) -> void:
	pathfinding_component.chase_target()
	if !Globals.player.health_component:
		next_state = idle_state

func on_exit() -> void:
	movement_component.speed_multiplier = 1.0

func get_nearest_guard() -> Guard:
	var guards: Array[Node] = get_tree().get_nodes_in_group("Guards")
	var new_target: Guard = guards[0]
	for guard in guards:
		if character.global_position.distance_to(guard.global_position) < \
				character.global_position.distance_to(new_target.global_position):
			new_target = guard
	return new_target
