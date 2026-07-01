extends State

@export var spotlight_component: SpotlightComponent

func on_enter() -> void:
	spotlight_component.queue_free()
