extends CharacterBody2D

class_name Villager

@export var sprite: Sprite2D
var player_body_manager: PlayerBodyManager

@export_category("Components") 
@export var movement_component: MovementComponent
@export var pathfinding_component: PathfindingComponent
@export var spotlight_component: SpotlightComponent
@export var health_component: HealthComponent
@export var hitbox_component: HitboxComponent

@export_category("States")
@export var state_machine: CharacterStateMachine
@export var running_state: State
@export var dead_state: State
@export var waiting_state: State
@export var hit_state: State

func _ready() -> void:
	health_component.on_death.connect(dead)
	spotlight_component.target_spotted.connect(_on_player_spotted)
	pathfinding_component.target_reached.connect(_in_guard_range)
	hitbox_component.on_interact.connect(_on_player_interacted)
	for child in owner.get_children():
		if child is PlayerBodyManager:
			player_body_manager = child

func _physics_process(delta: float) -> void:
	movement_component.movement_process(delta)
	
	if movement_component.dir:
		if spotlight_component:
			var targetRotation = get_angle_to(-movement_component.dir + global_position)
			targetRotation += PI / 2
			spotlight_component.rotation = lerp_angle(spotlight_component.rotation, targetRotation, delta * 4)

	if movement_component.prev_dir.x > 0:
		sprite.flip_h = false
	elif movement_component.prev_dir.x < 0:
		sprite.flip_h = true

func _on_player_spotted() -> void:
	if state_machine.current_state != running_state and movement_component.can_move:
		state_machine.current_state.next_state = running_state

func _in_guard_range() -> void:
	if pathfinding_component.target is Guard:
		var guard: Guard = pathfinding_component.target
		state_machine.current_state.next_state = waiting_state
		guard.on_player_spotted()

func dead() -> void:
	state_machine.current_state.next_state = dead_state

func _on_player_interacted() -> void:
	state_machine.current_state.next_state = hit_state
