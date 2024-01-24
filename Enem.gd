extends CharacterBody2D


const SPEED = 100.0

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var currentGrav = 0
#@onready var wallCheck_left: RayCast2D = $wallcheck_left
#@onready var wallCheck_right: RayCast2D = $walkcheck_right

@export var player = CharacterBody2D
var direction = Vector2()

func _physics_process(delta):
	if player.position.x - position.x > 0:
		direction.x =1
		scale.x = 1
	else:
		direction.x = -1
		scale.x = -1
		
	if$Rail_detect.has_overlapping_bodies():	
		if player.position.y - position.y >0:
			direction.y= 1
		else:
			direction.y = -1
	else:
		direction.y = 0
		
	
	
	velocity = direction * SPEED
	
	if not $Rail_detect.has_overlapping_bodies():
		currentGrav += gravity * delta
		velocity.y += currentGrav
	else:
		currentGrav = 0
		

	move_and_slide()
