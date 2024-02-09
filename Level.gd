extends Node2D

@export var totalGold = 1
@export var winUI = Control
@export var winTimer = Timer
 

var remainingGold = 0
# Called when the node enters the scene tree for the first time.
func _ready():
	 # Replace with function body.
	remainingGold = totalGold
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if(remainingGold == 0):
		winUI.visible = true


func _on_timer_timeout():
	print("hehehehehehehe") # Replace with function body.
