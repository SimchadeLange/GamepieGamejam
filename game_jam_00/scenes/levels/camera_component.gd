extends Camera2D

class_name CameraComponent

var target: Player

func _ready() -> void:
	if !Globals.current_player:
		await Globals.has_player
	target = Globals.current_player

func _physics_process(delta: float) -> void:
	if target:
		global_position = lerp(global_position, target.global_position, delta * 4)
