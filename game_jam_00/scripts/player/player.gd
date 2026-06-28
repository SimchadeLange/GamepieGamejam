extends CharacterBody2D

class_name Player

@export var sprite: Sprite2D
@export var state_machine: CharacterStateMachine
@export var health_component: HealthComponent
@export var weapon: Weapon

const SPEED: float = 42.0

var dir: Vector2
var prev_dir: Vector2
var can_move: bool = false
var can_roll: bool = true

func _physics_process(delta: float) -> void:
	# Getting current state can_move bool
	can_move = state_machine.current_state.can_move
	
	# Direction input and movement handling
	dir.x = Input.get_axis("move_left", "move_right")
	dir.y = Input.get_axis("move_up", "move_down")
	if dir and can_move:
		velocity = lerp(velocity, dir * SPEED, delta * 2)
		if prev_dir.x > 0:
			sprite.flip_h = false
		elif prev_dir.x < 0:
			sprite.flip_h = true
		prev_dir = dir
	else:
		velocity = lerp(velocity, Vector2.ZERO, delta * 10)
	
	move_and_slide()
