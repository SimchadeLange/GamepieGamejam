extends CharacterBody2D

class_name Player

@export var sprite: Sprite2D
@export var anim_tree: AnimationTree

@export_category("Components")
@export var health_component: HealthComponent
@export var movement_component: MovementComponent
@export var interact_component: InteractComponent

@export_category("States")
@export var state_machine: CharacterStateMachine

var can_roll: bool = true

func _ready() -> void:
	anim_tree.active = true
	Globals.player = self
	Globals.has_player.emit()

func _physics_process(delta: float) -> void:
	movement_component.dir.x = Input.get_axis("move_left", "move_right")
	movement_component.dir.y = Input.get_axis("move_up", "move_down")
	movement_component.movement_process(delta)
	
	if movement_component.prev_dir.x > 0:
		sprite.flip_h = false
	elif movement_component.prev_dir.x < 0:
		sprite.flip_h = true
	
	if movement_component.dir and movement_component.can_move:
		interact_component.position = movement_component.dir.normalized() * 8
