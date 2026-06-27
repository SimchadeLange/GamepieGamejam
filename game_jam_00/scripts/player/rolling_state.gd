extends State

const roll_force: float = 100.0

@export var idle_state: State
@export var roll_duration_timer: Timer
@export var roll_cooldown_timer: Timer


func _ready() -> void:
	roll_duration_timer.timeout.connect(_on_roll_duration_timeout)


func on_enter() -> void:
	character.velocity += character.dir * roll_force
	roll_duration_timer.start()


#func state_process(delta) -> void:
	#character.velocity = lerp(character.velocity, Vector2.ZERO, delta)
	#character.velocity.normalized()


func on_exit() -> void:
	roll_duration_timer.stop()
	character.velocity -= character.velocity / 2
	roll_cooldown_timer.start()


func _on_roll_duration_timeout() -> void:
	next_state = idle_state
