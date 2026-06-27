extends Label

@export var state_machine : CharacterStateMachine
@onready var player = get_owner()

func _process(_delta: float) -> void:
	text = "State : " +  state_machine.current_state.name
	player = get_owner()
