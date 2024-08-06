extends CharacterBody3D

const SPEED = 6
const ROTATION = 7

func _ready():
	pass

func _physics_process(_delta):
	if Input.is_action_pressed("ui_right") and Input.is_action_pressed("ui_left"):
		velocity.x = 0
	elif Input.is_action_pressed("ui_right"):
		velocity.x = SPEED
		$MeshInstance3D.rotate_z(deg_to_rad(-ROTATION))
	elif Input.is_action_pressed("ui_left"):
		velocity.x = -SPEED
		$MeshInstance3D.rotate_z(deg_to_rad(ROTATION))
	else:
		velocity.x = lerp(velocity.x, 0.0, 0.1)  # Adjusted the interpolation factor for smoother deceleration
		
	if Input.is_action_pressed("ui_up") and Input.is_action_pressed("ui_down"):
		velocity.z = 0
	elif Input.is_action_pressed("ui_up"):
		velocity.z = -SPEED
		$MeshInstance3D.rotate_x(deg_to_rad(-ROTATION))
	elif Input.is_action_pressed("ui_down"):
		velocity.z = SPEED
		$MeshInstance3D.rotate_x(deg_to_rad(ROTATION))
	else:
		velocity.z = lerp(velocity.z, 0.0, 0.1)  # Adjusted the interpolation factor for smoother deceleration

	move_and_slide()
