extends Node2D

var L2 = preload("res://l_2.tscn").instantiate()
var L3 = preload("res://L3.tscn").instantiate()
# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func _Trans_1_2(lev):
	if(lev == 1):
		add_child(L2)
		$L1.queue_free()
	if(lev == 2):
		add_child(L3)
		$L2.queue_free()
