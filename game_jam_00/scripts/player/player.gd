extends CharacterBody2D

class_name Player

@export var sprite: Sprite2D
@export var state_machine: CharacterStateMachine
@export var anim_tree: AnimationTree
@export var movement_component: MovementComponent
@export var health_component: HealthComponent
@export var weapon: Weapon

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
		weapon.hurtbox.position.x = 6
	elif movement_component.prev_dir.x < 0:
		sprite.flip_h = true
		weapon.hurtbox.position.x = -6
