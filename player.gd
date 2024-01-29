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
		if not $Rail_detect.has_overlapping_bodies():
			$AnimationPlayer.play("Run")
			gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
		else:
			$AnimationPlayer.play("climb_horiz")
		velocity.x = xInput * SPEED
		if xInput > 0:
			$Sprite2D.scale.x = 1
		else:
			$Sprite2D.scale.x = -1
	else:
		$AnimationPlayer.play("idle")
		velocity.x = move_toward(velocity.x, 0, SPEED)
	
	if $Rail_detect.has_overlapping_bodies():
		velocity.y = yInput *SPEED
		if(not xInput):
			$AnimationPlayer.play("climb_horiz_idle")
	
	if($Ladder_detect.has_overlapping_bodies()):
		velocity.y = yInput *SPEED
		$AnimationPlayer.play("climb_vert")
		
	if $Area2D.has_overlapping_bodies():
		get_tree().reload_current_scene()

	move_and_slide()
