extends State

@export var movement_component: MovementComponent
@export var wander_timer: Timer
@export var next_wander_timer: Timer
@export var min_wander_time: float = 2.0
@export var max_wander_time: float = 4.0

func _ready() -> void:
	next_wander_timer.timeout.connect(wander)
	wander_timer.timeout.connect(wait_for_wander)

func on_enter() -> void:
	wait_for_wander()

func on_exit() -> void:
	next_wander_timer.stop()
	wander_timer.stop()
	movement_component.dir = Vector2.ZERO

func wait_for_wander() -> void:
	movement_component.dir = Vector2.ZERO
	next_wander_timer.wait_time = randf_range(min_wander_time, max_wander_time)
	next_wander_timer.start()

func wander() -> void:
	wander_timer.wait_time = randf_range(min_wander_time, max_wander_time)
	wander_timer.start()
	movement_component.dir = Vector2(randf_range(-1.0, 1.0), randf_range(-1.0, 1.0))
