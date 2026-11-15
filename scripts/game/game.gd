extends Node2D

@onready var paddle: CharacterBody2D = $Paddle
@onready var ball: Ball = $Ball
@onready var pointsLabel: Label = $Points
# All the block
const ALPHABET_BLOCK = preload("res://scenes/bricks/alphabet_block.tscn")
@onready var lives: AnimatedSprite2D = $Lives
@onready var level_sprite: Sprite2D = $LevelSprite

const LEVEL_SPRITES = [
	"res://assets/sprites/EnglishRoom.png",
	"res://assets/sprites/HistoryRoom.png",
	"res://assets/sprites/MathRoom.png",
	"res://assets/sprites/ScienceRoom.png",
    "res://assets/sprites/ArtRoom.png"
]

var sprite_path = LEVEL_SPRITES[Globals.currentLevel]



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
	paddle.global_position = Vector2(160, 165)


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
	
	if (ball.position.y > 185):
		death()
	pointsLabel.text = "Points: " + str(Globals.points)  + "/" + str(levelRequirments)

func _input(event: InputEvent) -> void:
	if ( Input.is_action_just_pressed("start")):
		Globals.lives -= 1
		lives.set_frame(Globals.lives)
		Globals.is_active = true
		
func death():
	if Globals.lives > 0:
			Globals.is_active = false
			paddle.global_position = Vector2(160, 165)
	else:
		if (points > levelRequirments):
			Globals.levels += 1
		get_tree().change_scene_to_file("res://scenes/game/shop.tscn")
	
	
