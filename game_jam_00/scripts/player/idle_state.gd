extends State

@export var rolling_state: State
@export var roll_cooldown_timer: Timer


func _ready() -> void:
	roll_cooldown_timer.timeout.connect(_on_roll_cooldown_timeout)


func on_enter():
	pass


func state_process(_delta):
	pass


func state_input(event : InputEvent):
	if event.is_action_pressed("ui_accept"):
		next_state = rolling_state


func _on_roll_cooldown_timeout() -> void:
	character.can_roll = true
