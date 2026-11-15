extends Node2D

const BASE_BRICK = preload("res://scenes/bricks/base_brick.tscn")

var columns = 6
var rows = 4
var blocksizeX = 30 + 1
var blocksizeY = 15 + 1

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	grid_setup()

func grid_setup():
	for r in rows:
		for c in columns: 
			var newBrick =  BASE_BRICK.instantiate()
			add_child(newBrick)
			print("GSsg")
			newBrick.position = Vector2(80 + (blocksizeX * c), 15 + (blocksizeY * r))

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
