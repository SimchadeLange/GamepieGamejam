extends State

@export var movement_component: MovementComponent
@export var pathfinding_component: PathfindingComponent
@export var next_wander_timer: Timer
@export var min_wander_time: float = 2.0
@export var max_wander_time: float = 4.0
var walking_to_path: bool = false
var current_path_index: int

func _ready() -> void:
	next_wander_timer.timeout.connect(wander)

func on_enter() -> void:
	current_path_index = -1
	wait_for_next_path_point()

func state_process(_delta: float) -> void:
	if walking_to_path:
		pathfinding_component.chase_target()
		if pathfinding_component.is_target_reached():
			walking_to_path = false
			wait_for_next_path_point()

func on_exit() -> void:
	next_wander_timer.stop()
	movement_component.dir = Vector2.ZERO

func wait_for_next_path_point() -> void:
	movement_component.dir = Vector2.ZERO
	next_wander_timer.wait_time = randf_range(min_wander_time, max_wander_time)
	current_path_index = (current_path_index + 1) % \
		character.patrol_path.path_points.size()
	pathfinding_component.target = character.patrol_path.path_points[current_path_index]
	next_wander_timer.start()

func wander() -> void:
	walking_to_path = true
