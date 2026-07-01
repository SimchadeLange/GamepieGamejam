extends State

@export var movement_component: MovementComponent

func on_enter() -> void:
	movement_component.process_mode = Node.PROCESS_MODE_DISABLED

func on_exit() -> void:
	movement_component.process_mode = Node.PROCESS_MODE_PAUSABLE
