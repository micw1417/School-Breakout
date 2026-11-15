extends Node

static var points : int
static var levels_beat := 0
static var is_active := false
#blocks_invintory
static var lvl_1_blocks = {
	"Multiplication":
		{"price": 67, "image": preload("uid://cse58se1avw7w"), "description": ""},
	"Addition":
		{"price": 68, "image": preload("uid://dda7vbsju4nav"), "description": ""},
	"Subtraction":
		{"price": 69, "image": preload("uid://c8ioqvhg3bmco"), "description": ""},
	"Division":
		{"price": 70, "image": preload("res://assets/sprites/Rectangles/BlankBlock.png"), "description": ""},
}
static var lvl_2_blocks = {
	"Analogy":
		{"price": 100, "image": ImageTexture, "description": ""},
	"Alphabet":
		{"price": 100, "image": ImageTexture, "description": ""},
	"Essay Draft":
		{"price": 100, "image": ImageTexture, "description": ""},
	"Climax":
		{"price": 100, "image": ImageTexture, "description": ""},
}
static var lvl_3_blocks = {
	"Evolution":
		{"price": 100, "image": ImageTexture, "description": ""},
	"Mitochondria":
		{"price": 100, "image": ImageTexture, "description": ""},
	"Gas":
		{"price": 100, "image": ImageTexture, "description": ""},
	"Cell Division":
		{"price": 100, "image": ImageTexture, "description": ""},
}
static var lvl_4_blocks = {
	"Census":
		{"price": 100, "image": ImageTexture, "description": ""},
	"Exploration":
		{"price": 100, "image": ImageTexture, "description": ""},
	"President":
		{"price": 100, "image": ImageTexture, "description": ""},
	"Latitude":
		{"price": 100, "image": ImageTexture, "description": ""},
}
static var lvl_5_blocks = {
	"Paintbrush":
		{"price": 100, "image": ImageTexture, "description": ""},
	"Paper Airplane":
		{"price": 100, "image": ImageTexture, "description": ""},
	"Spill":
		{"price": 100, "image": ImageTexture, "description": ""},
	"Outline":
		{"price": 100, "image": ImageTexture, "description": ""},
}
