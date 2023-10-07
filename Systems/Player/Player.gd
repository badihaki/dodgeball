extends Node
class_name Player

var input_actions:PlayerInputs

func _ready() -> void:
	input_actions = $Inputs
	input_actions.pass_action.connect(OnPass)

func OnPass()->void:
	print("passing at"+Time.get_date_string_from_system())
