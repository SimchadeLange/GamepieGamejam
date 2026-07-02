extends State

@export var spotlight_component: SpotlightComponent

func on_enter() -> void:
	spotlight_component.queue_free()
	character.player_body_manager.replace_with_new_player(character)
