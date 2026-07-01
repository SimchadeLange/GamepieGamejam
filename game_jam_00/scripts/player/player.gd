extends CharacterBody2D

class_name Player

@export var sprite: Sprite2D
@export var anim_tree: AnimationTree

@export_category("Components")
@export var health_component: HealthComponent
@export var movement_component: MovementComponent
@export var interact_component: InteractComponent

@export_category("States")
@export var state_machine: CharacterStateMachine
@export var dead_state: State
@export var hit_state: State

var can_roll: bool = true

func _ready() -> void:
	anim_tree.active = true
	Globals.player = self
	Globals.has_player.emit()
	health_component.on_death.connect(_on_death)
	health_component.on_damage.connect(_on_hit)
	

func _physics_process(delta: float) -> void:
	movement_component.dir.x = Input.get_axis("move_left", "move_right")
	movement_component.dir.y = Input.get_axis("move_up", "move_down")
	movement_component.movement_process(delta)
	
	if movement_component.prev_dir.x > 0:
		sprite.flip_h = false
	elif movement_component.prev_dir.x < 0:
		sprite.flip_h = true
	
	if movement_component.dir and movement_component.can_move:
		interact_component.position = movement_component.dir.normalized() * 8

func _on_death() -> void:
	state_machine.current_state.next_state = dead_state

func _on_hit(_attack: Attack) -> void:
	state_machine.current_state.next_state = hit_state
