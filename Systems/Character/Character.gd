extends CharacterBody2D

class_name Character

@export_category("Stats")
@export_category("Movement Speed")
@export var forward_move_speed:float = 3.0
@export var backwards_move_speed:float = 1.50
@export var vertical_move_speed:float = 100.0
@export var throw_power:float = 500.0
@export var dodge_power:float = 350.0
@export var dodge_recovery:float = 2.5
@export var catch_time:float = 0.25
@export var catch_recovery: float = 3.0

@export_category("Player/Team Settings")
@export var team_member_id:int
@export var is_controlled_by_player:bool = false
@export var controlling_player:Player
@export var left_field_team:bool = true

signal picked_up_ball

const JUMP_VELOCITY = -400.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity: int = ProjectSettings.get_setting("physics/2d/default_gravity")


func _physics_process(delta: float) -> void:
	if is_controlled_by_player:
		MovePCHorizontal(controlling_player.input_actions.movement)
		MovePCVertical(controlling_player.input_actions.movement)

	move_and_slide()

func MovePCHorizontal(direction:Vector2)->void:
	if not direction.x == 0:
		if left_field_team:
			if direction.x > 0.2:
				velocity.x = forward_move_speed * 100
			elif direction.x < -0.2:
				velocity.x = -backwards_move_speed * 100
		else :
			if direction.x < -0.2:
				velocity.x = -forward_move_speed * 100
			elif direction.x > 0.2:
				velocity.x = backwards_move_speed * 100
	else :
		velocity.x = 0

func MovePCVertical(dirction:Vector2)->void:
	if not dirction.y == 0:
		if dirction.y > 0.2:
			velocity.y = vertical_move_speed
		elif dirction.y < -0.2:
			velocity.y = -vertical_move_speed
	else:
		velocity.y = 0

func AddGravity(delta:float)->void:
	if not is_on_floor():
		velocity.y += gravity * delta

func HandleJump()->void:
		if Input.is_action_just_pressed("ui_accept") and is_on_floor():
			velocity.y = JUMP_VELOCITY

func OnPickUpBall()->void:
	picked_up_ball.emit(team_member_id)
