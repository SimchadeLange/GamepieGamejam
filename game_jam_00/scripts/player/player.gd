extends CharacterBody2D

class_name Player

@export var sprite: Sprite2D
@export var anim_tree: AnimationTree
var player_body_manager: PlayerBodyManager

@export_category("Components")
@export var health_component: HealthComponent
@export var movement_component: MovementComponent
@export var interact_component: InteractComponent

@export_category("States")
@export var state_machine: CharacterStateMachine
@export var dead_state: State
@export var hit_state: State
@export var sleep_state: State

var can_roll: bool = true

func _ready() -> void:
	anim_tree.active = true
	if !Globals.current_player:
		Globals.current_player = self
	Globals.has_player.emit()
	Globals.available_players.append(self)
	health_component.on_death.connect(_on_death)
	health_component.on_damage.connect(_on_hit)
	player_body_manager = get_tree().get_first_node_in_group("PlayerBodyManager")
	if !Globals.current_player == self:
		state_machine.current_state.next_state = sleep_state

func _physics_process(delta: float) -> void:
	movement_component.dir.x = Input.get_axis("move_left", "move_right")
	movement_component.dir.y = Input.get_axis("move_up", "move_down")
	
	if Globals.current_player == self:
		movement_component.movement_process(delta)
	
	if movement_component.prev_dir.x > 0:
		sprite.flip_h = false
	elif movement_component.prev_dir.x < 0:
		sprite.flip_h = true
	
	if movement_component.dir and movement_component.can_move:
		interact_component.position = movement_component.dir.normalized() * 8

func _on_death() -> void:
	state_machine.current_state.next_state = dead_state

func _on_hit(_attack: Attack) -> void:
	state_machine.current_state.next_state = hit_state
