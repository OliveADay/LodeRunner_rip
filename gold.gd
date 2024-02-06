extends Area2D

@export var Level = Node2D

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if(get_overlapping_bodies()):
		visible = false
		Level.remainingGold -= 1
		set_process(false)
