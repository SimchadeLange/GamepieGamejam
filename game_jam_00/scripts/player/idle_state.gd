extends State

@export var rolling_state: State
@export var attack_state: State
@export var roll_cooldown_timer: Timer
@export var interact_component: InteractComponent

func _ready() -> void:
	roll_cooldown_timer.timeout.connect(_on_roll_cooldown_timeout)

func on_enter():
	pass

func state_process(_delta):
	pass

func state_input(event: InputEvent):
	if event.is_action_pressed("roll") and character.can_roll:
		next_state = rolling_state
	elif event.is_action_pressed("interact") and interact_component.in_interactable:
		if interact_component.in_interactable.health_component:
			next_state = attack_state
		#interact_component.in_interactable.interact()

func _on_roll_cooldown_timeout() -> void:
	character.can_roll = true
