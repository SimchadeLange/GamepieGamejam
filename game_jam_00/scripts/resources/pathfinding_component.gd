extends NavigationAgent2D

@export var character: PhysicsBody2D
@export var movement_component: MovementComponent

func _ready() -> void:
	await Globals.has_player
	target_position = Globals.player.global_position

func _physics_process(_delta: float) -> void:
	if !is_target_reached():
		movement_component.dir = character.to_local(get_next_path_position().normalized())
