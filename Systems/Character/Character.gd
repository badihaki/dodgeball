extends CharacterBody2D

class_name Character

@export_category("Stats")
@export_category("Movement Speed")
@export var forward_move_speed:float = 150.0
@export var backwards_move_speed:float = 85.0
@export var vertical_move_speed:float = 100.0
@export var throw_power:float = 500.0
@export var dodge_power:float = 350.0
@export var dodge_recovery:float = 2.5
@export var catch_time:float = 0.25
@export var catch_recovery: float = 3.0

@export_category("Player Settings")
@export var is_controlled_by_player:bool = false
@export var controlling_player:Player
@export var left_field_team:bool = true

const JUMP_VELOCITY = -400.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity: int = ProjectSettings.get_setting("physics/2d/default_gravity")


func _physics_process(delta: float) -> void:
	if is_controlled_by_player:
		MovePCHorizontal(controlling_player.input_actions.movement)
		MovePCVertical(controlling_player.input_actions.movement)
	# As good practice, you should replace UI actions with custom gameplay actions.
#	var direction := Input.get_axis("ui_left", "ui_right")
#	if direction:
#		velocity.x = direction * forward_move_speed
#	else:
#		velocity.x = move_toward(velocity.x, 0, forward_move_speed)

	move_and_slide()

func MovePCHorizontal(direction:Vector2)->void:
	if not direction.x == 0:
		if left_field_team:
			if direction.x > 0.2:
				velocity.x = forward_move_speed
			elif direction.x < -0.2:
				velocity.x = -backwards_move_speed
		else :
			if direction.x < -0.2:
				velocity.x = -forward_move_speed
			elif direction.x > 0.2:
				velocity.x = backwards_move_speed
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
