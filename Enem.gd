extends CharacterBody2D


const SPEED = 100.0

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

#@onready var wallCheck_left: RayCast2D = $wallcheck_left
#@onready var wallCheck_right: RayCast2D = $walkcheck_right

@export var player = CharacterBody2D
var direction = Vector2()
var previousPos = Vector2()

func _ready():
	if position.y - player.position.y < 0:
		if $Rail_detect.has_overlapping_bodies():
			direction.y = 1
		else:
			direction.y = 0
		if(abs($wallcheck_left.get_collision_point().x - position.x) > abs($walkcheck_right.get_collision_point().x - position.x)):
			direction.x = -1
		else:
			direction.x = 1
	else: if position.y - player.position.y > 0:
		if $ladder_detect.has_overlapping_bodies():
			direction.y = -1
		else:
			direction.y = 0
		if(abs($laddercheck_left.get_collision_point().x - position.x) > abs($laddercheck_right.get_collision_point().x - position.x)):
			direction.x = -1
		else:
			direction.x = 1
	else:
		if position.x - player.position.x > 0:
			direction.x = 1
		else:
			direction.x = -1

func _physics_process(delta):
	#below
	if position.y - player.position.y < 0 and position.y != previousPos.y:
		if $Rail_detect.has_overlapping_bodies():
			direction.y = 1
		else:
			direction.y = 0
		if(abs($wallcheck_left.get_collision_point().x - position.x) > abs($walkcheck_right.get_collision_point().x - position.x)):
			direction.x = -1
		else:
			direction.x = 1
	else: if position.y - player.position.y > 0 and position.y != previousPos.y:
		if $ladder_detect.has_overlapping_bodies():
			direction.y = -1
		else:
			direction.y = 0
		if(abs($laddercheck_left.get_collision_point().x - position.x) > abs($laddercheck_right.get_collision_point().x - position.x)):
			direction.x = -1
		else:
			direction.x = 1
	else:
		if position.x - player.position.x > 0:
			direction.x = 1
		else:
			direction.x = -1
			
		
	velocity = direction * SPEED
	
	if not $Rail_detect.has_overlapping_bodies():
		velocity.y += gravity * delta
		
	previousPos = position

	move_and_slide()
