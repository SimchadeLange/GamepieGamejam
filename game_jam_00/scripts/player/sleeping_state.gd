extends State

@export var movement_component: MovementComponent
@export var idle_state: State

func state_process(_delta: float) -> void:
	if Globals.current_player == character:
		next_state = idle_state
