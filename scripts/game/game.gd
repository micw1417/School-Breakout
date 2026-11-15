extends Node2D

@onready var paddle: CharacterBody2D = $Paddle
@onready var ball: Ball = $Ball
@onready var pointsLabel: Label = $Points
# All the block
const ALPHABET_BLOCK = preload("res://scenes/bricks/alphabet_block.tscn")

const BASE_BRICK = preload("res://scenes/bricks/base_brick.tscn")

var points = 0
var columns = 6
var rows = 4
var blocksizeX = 30 + 1
var blocksizeY = 15 + 1
var currentLevel = 0
var levelRequirments = 20

var blocks := [[ BASE_BRICK, BASE_BRICK, BASE_BRICK, BASE_BRICK, BASE_BRICK, BASE_BRICK],
				[BASE_BRICK, ALPHABET_BLOCK, BASE_BRICK, BASE_BRICK, BASE_BRICK, BASE_BRICK],
				[BASE_BRICK, BASE_BRICK, BASE_BRICK, BASE_BRICK, BASE_BRICK, BASE_BRICK],
				[BASE_BRICK, BASE_BRICK, BASE_BRICK, BASE_BRICK, BASE_BRICK, BASE_BRICK]]
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	grid_setup()
	paddle.global_position = Vector2(160, 166)
func grid_setup():
	for r in rows:
		for c in columns: 
			var newBrick =  blocks[r][c].instantiate()
			add_child(newBrick)
			newBrick.position = Vector2(80 + (blocksizeX * c), 15 + (blocksizeY * r))

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if (not Globals.is_active):
		ball.global_position = Vector2(paddle.position.x, paddle.position.y - 10)

	pointsLabel.text = "Points: " + str(Globals.points)  + "/" + str(levelRequirments)

func shop_transition():
	get_tree().change_scene_to_file("res://scenes/game/shop.tscn")
