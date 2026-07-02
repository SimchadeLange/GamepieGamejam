extends Node

class_name MovementComponent

@export var character: CharacterBody2D
@export var state_machine: CharacterStateMachine
@export var stun_timer: Timer
@export var speed: float = 42.0
@export var speed_multiplier: float = 1.0
@export var speed_buildup: float = 2.0

var dir: Vector2
var prev_dir: Vector2
var can_move: bool = true

func movement_process(delta: float) -> void:
	if state_machine:
		can_move = state_machine.current_state.can_move
	
	# Direction input and movement handling
	if dir and can_move:
		character.velocity = lerp(character.velocity, dir * speed * speed_multiplier,
			delta * speed_buildup)
		prev_dir = dir
	else:
		character.velocity = lerp(character.velocity, Vector2.ZERO, delta * 10)
	
	character.move_and_slide()

func knockback(knockback_dir: Vector2, force: float, stun_duration: float) -> void:
	character.velocity = knockback_dir * force
	if stun_timer:
		stun_timer.wait_time = stun_duration
	
