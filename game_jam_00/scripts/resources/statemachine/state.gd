extends Node

class_name State

@onready var states = get_parent().states
@export var can_move: bool = true

var character: CharacterBody2D
var next_state: State

func state_process(_delta: float) -> void:
	pass

func state_input(_event: InputEvent) -> void:
	pass

func on_enter() -> void:
	pass

func on_exit() -> void:
	pass
