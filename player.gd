extends CharacterBody2D


const SPEED = 150.0
const climb_velocity = 300

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	# Handle jump

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var xInput = Input.get_axis("move_left", "move_right")
	var yInput = Input.get_axis("move_up", "move_down")
	if xInput:
		velocity.x = xInput * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
