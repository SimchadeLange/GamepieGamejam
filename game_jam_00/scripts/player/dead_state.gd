extends State

@export var flash_component: FlashComponent

func on_enter() -> void:
	flash_component.flash()
