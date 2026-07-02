extends Node

class_name PlayerBodyManager

var available_players: Array[Player] = Globals.available_players
var current_player_index: int = -1
@export var player_scene: PackedScene
@export var camera: CameraComponent

func _ready() -> void:
	next_player_body()

func next_player_body() -> void:
	current_player_index = (current_player_index + 1) % \
		Globals.available_players.size()
	Globals.current_player = Globals.available_players[current_player_index]
	camera.target = Globals.current_player

func replace_with_new_player(body: CharacterBody2D) -> void:
	var new_player: Player = player_scene.instantiate()
	add_sibling(new_player, true)
	new_player.global_position = body.global_position
	body.queue_free()
