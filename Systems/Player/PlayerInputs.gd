extends Node
class_name PlayerInputs

@export var movement:Vector2
signal move_action
signal throw_action
signal pass_action
signal dodge_action


func _unhandled_key_input(event: InputEvent) -> void:
	if event.is_action_pressed("pass"):
		pass_action.emit()
	if event.is_action_pressed("throw"):
		throw_action.emit()
	if event.is_action_pressed("dodge"):
		dodge_action.emit()
	HandleMovement()

func HandleMovement()->void:
	var movement_input:Vector2 = Input.get_vector("move_left","move_right","move_up","move_down")
	# For X
	if movement_input.x > 0.65:
		movement_input.x = 1
	elif movement_input.x < -0.65:
		movement_input.x = -1
	else: movement_input.x = 0
	# Now For Y
	if movement_input.y > 0.65:
		movement_input.y = 1
	elif movement_input.y < -0.65:
		movement_input.y = -1
	else: movement_input.y = 0
	
	movement = movement_input
