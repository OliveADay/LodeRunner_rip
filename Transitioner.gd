extends Node2D

@export var whatLev = 2

var world = [Node]

# Called when the node enters the scene tree for the first time.
func _ready():
	world = get_tree().get_nodes_in_group("World") # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_timer_timeout():
	world[0]._Trans_1_2(whatLev) # Replace with function body.
