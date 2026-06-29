extends CharacterBody2D

@export var state_machine: CharacterStateMachine
@export var movement_component: MovementComponent
@export var pathfinding_component: PathfindingComponent
@export var spotlight_component: SpotlightComponent
@export var health_component: HealthComponent
@export var sprite: Sprite2D
@export var chasing_state: State

func _ready() -> void:
	health_component.on_death.connect(dead)
	spotlight_component.target_spotted.connect(_on_player_found)

func _physics_process(delta: float) -> void:
	movement_component.movement_process(delta)
	if movement_component.dir:
		var targetRotation = get_angle_to(-movement_component.dir + global_position)
		targetRotation += PI / 2
		spotlight_component.rotation = lerp_angle(spotlight_component.rotation, targetRotation, delta * 4)
	if movement_component.prev_dir.x > 0:
		sprite.flip_h = false
	elif movement_component.prev_dir.x < 0:
		sprite.flip_h = true

func _on_player_found() -> void:
	state_machine.current_state.next_state = chasing_state

func dead() -> void:
	print("dead")
