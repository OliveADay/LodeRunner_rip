extends Node2D

@export var totalGold = 1
@export var winUI = Control
@export var winTimer = Timer
@export var whatLev = 1

var world = [Node]


var remainingGold = 0
# Called when the node enters the scene tree for the first time.
func _ready():
	 # Replace with function body.
	remainingGold = totalGold
	remove_child($ColorRect2)
	world = get_tree().get_nodes_in_group("World")
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	world = get_tree().get_nodes_in_group("World")
	if(remainingGold == 0):
		add_child(winUI)
		winUI.visible = true
		

func _on_timer_timeout():
	world[0]._Trans_1_2(whatLev) # Replace with function body.
