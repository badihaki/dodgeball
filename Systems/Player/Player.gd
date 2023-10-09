extends Node
class_name Player

var input_actions:PlayerInputs

@export_category("Team Settings")
@export var is_left_field_team:bool
@export var team_members:Array[PackedScene]
@export var field_characters:Array[Character]
@export var field_char_index:int = 0

func _ready() -> void:
	input_actions = $Inputs
	BuildTeamGameplay()
	input_actions.pass_action.connect(PassControlToNextCharacter)

func BuildTeamGameplay()->void:
	if team_members.size() < 3:
		printerr("Need more members for team")
		return
	elif team_members.size() > 3:
		printerr("Too many team members, slicing array elements 0-3")
		var new_team_members = team_members.slice(0,3)
		team_members = new_team_members
		_PutCharactersOnField()
	elif team_members.size() == 3:
		_PutCharactersOnField()

func _PutCharactersOnField()->void:
	var spawn_points:Array[Node] = get_node("../Spawn").get_children()
	while field_characters.size() != team_members.size():
		var char_build = team_members[field_char_index].instantiate()
		char_build.controlling_player = self
		add_child(char_build)
		char_build.position = spawn_points[field_char_index].position
		field_characters.append(char_build)
		field_char_index += 1
	field_char_index = 0
	GiveControlToCharacterIndex()

func PassControlToNextCharacter()->void:
	# cleanup logic for old controlled character should go here
	field_characters[field_char_index].velocity = Vector2.ZERO
	field_characters[field_char_index].is_controlled_by_player = false
	# cleanup logic for old controlled character should go here
	field_char_index += 1
	if field_char_index > field_characters.size() - 1:
		field_char_index = 0
	# setup logic for new controlled character should go here
	field_characters[field_char_index].is_controlled_by_player = true
	# setup logic for new controlled character should go here

func GiveControlToCharacterIndex()->void:
	field_characters[field_char_index].is_controlled_by_player = true
