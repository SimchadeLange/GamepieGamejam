extends CharacterBody2D

class_name Guard

@export var sprite: Sprite2D

@export_category("Components") 
@export var movement_component: MovementComponent
@export var pathfinding_component: PathfindingComponent
@export var spotlight_component: SpotlightComponent
@export var health_component: HealthComponent
@export var attack_component: AttackComponent

@export_category("States")
@export var state_machine: CharacterStateMachine
@export var chasing_state: State
@export var attacking_state: State
@export var dead_state: State

func _ready() -> void:
	health_component.on_death.connect(dead)
	spotlight_component.target_spotted.connect(on_player_spotted)
	pathfinding_component.target_reached.connect(_in_player_range)
	await Globals.has_player
	pathfinding_component.target = Globals.player

func _physics_process(delta: float) -> void:
	movement_component.movement_process(delta)
	
	if movement_component.dir:
		if spotlight_component:
			var targetRotation = get_angle_to(-movement_component.dir + global_position)
			targetRotation += PI / 2
			spotlight_component.rotation = lerp_angle(spotlight_component.rotation, targetRotation, delta * 4)
		attack_component.position = movement_component.dir.normalized() * 16

	if movement_component.prev_dir.x > 0:
		sprite.flip_h = false
	elif movement_component.prev_dir.x < 0:
		sprite.flip_h = true

func on_player_spotted() -> void:
	if state_machine.current_state != chasing_state and \
			movement_component.can_move:
		state_machine.current_state.next_state = chasing_state

func _in_player_range() -> void:
	state_machine.current_state.next_state = attacking_state

func dead() -> void:
	state_machine.current_state.next_state = dead_state
