extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$CenterContainer/VBoxContainer/Start.grab_focus()

func _on_start_pressed() -> void:
	get_tree().change_scene_to_file("uid://dg20bly5q7crl") # main

func _on_exit_pressed() -> void:
	get_tree().quit()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
