extends State

@export var flash_component: FlashComponent

func on_enter() -> void:
	flash_component.flash()
	if Globals.current_player != character:
		character.queue_free()
		Globals.available_players.erase(character)
