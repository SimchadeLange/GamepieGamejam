extends Node2D

class_name PathComponent

@onready var path_points: Array[Node2D]

func _ready() -> void:
	for child in get_children():
		if child is PathPoint:
			path_points.append(child)
		else:
			push_warning(child.name + " Is not a path point for " + self.name)
