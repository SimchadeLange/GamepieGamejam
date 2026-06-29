extends State

@export var wander_timer: Timer
@export var next_wander_timer: Timer
@export var min_wander_time: float = 2.0
@export var max_wander_time: float = 10.0

func _ready() -> void:
	pass

func on_enter() -> void:
	next_wander_timer.wait_time = randf_range(min_wander_time, max_wander_time)

func start_wandering() -> void:
	pass
