extends CharacterBody2D

const SPEED = 125.0

var direction: Vector2
 

func _physics_process(delta: float) -> void:
	#Direction input and movement handling
	direction.x = Input.get_axis("move_left", "move_right")
	direction.y = Input.get_axis("move_up", "move_down")
	if direction:
		velocity = lerp(velocity, direction * SPEED, delta * 2)
	else:
		velocity = lerp(velocity, Vector2.ZERO, delta * 10)
	move_and_slide()
