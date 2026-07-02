extends NavigationAgent2D

class_name PathfindingComponent

@export var character: PhysicsBody2D
@export var movement_component: MovementComponent
var target: Node2D

func chase_target() -> void:
	if target:
		target_position = target.global_position
	if !is_target_reached():
		movement_component.dir = character.to_local(get_next_path_position()).normalized()
