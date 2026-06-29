extends PointLight2D

class_name SpotlightComponent

signal target_spotted

@export var movement_component: MovementComponent
@export var light_area: Area2D

func _ready() -> void:
	light_area.area_entered.connect(_on_light_area_entered)

func _on_light_area_entered(area: Area2D) -> void:
	if area is HitboxComponent:
		target_spotted.emit()
