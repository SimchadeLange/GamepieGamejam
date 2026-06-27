extends CharacterBody2D

class_name Player

@export var p_sprite: Sprite2D
@export var state_machine: CharacterStateMachine

const SPEED: float = 42.0

var dir: Vector2
var prev_dir: Vector2
var can_move: bool = false

func _physics_process(delta: float) -> void:
	can_move = state_machine.current_state.can_move
	
	#Direction input and movement handling
	dir.x = Input.get_axis("move_left", "move_right")
	dir.y = Input.get_axis("move_up", "move_down")
	if dir:
		velocity = lerp(velocity, dir * SPEED, delta * 2)
		if prev_dir.x > 0:
			p_sprite.flip_h = false
		elif prev_dir.x < 0:
			p_sprite.flip_h = true
		prev_dir = dir
	else:
		velocity = lerp(velocity, Vector2.ZERO, delta * 10)
	move_and_slide()
