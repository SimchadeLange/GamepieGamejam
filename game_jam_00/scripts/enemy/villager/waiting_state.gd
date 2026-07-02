extends State

@export var idle_state: State
@export var cooldown_timer: Timer
@export var pathfinding_component: PathfindingComponent

func _ready() -> void:
	cooldown_timer.timeout.connect(_on_cooldown_timeout)

func on_enter() -> void:
	cooldown_timer.start()
	pathfinding_component.target = Globals.current_player

func state_process(_delta: float) -> void:
	pathfinding_component.chase_target()

func on_exit() -> void:
	cooldown_timer.stop()
	pathfinding_component.target = null

func _on_cooldown_timeout() -> void:
	next_state = idle_state
