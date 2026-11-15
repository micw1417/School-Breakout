extends Node

static var paddle = null
static var ball = null
static var points : int
static var levels_beat := 0
static var is_active := false
static var lives: = 3
static var currentLevel := Levels.ENGLISH

enum Levels {
	ENGLISH,
	HISTORY,
	MATH,
	SCIENCE,
	ART
}


#blocks_invintory
static var lvl_1_blocks = {
	"Multiplication":
		{"price": 67, "image": preload("uid://cse58se1avw7w"), "description": "Enlarges your paddle"},
	"Addition":
		{"price": 68, "image": preload("uid://dda7vbsju4nav"), "description": "Spawns another ball"},
	"Subtraction":
		{"price": 69, "image": preload("uid://c8ioqvhg3bmco"), "description": "Spawns a ghost block"},
	"Division":
		{"price": 70, "image": preload("uid://da5mhjofb63o0"), "description": "Smaller paddle, faster ball"},
}
static var lvl_2_blocks = {
	"Analogy":
		{"price": 100, "image": preload("uid://ffio3jdajph4"), "description": "Spawns another block"},
	"Alphabet":
		{"price": 100, "image": preload("uid://7ytuh1vwmi84"), "description": "+1 point per alphabet block"},
	"Essay Draft":
		{"price": 100, "image": preload("uid://cgj61hamdhwe1"), "description": "First hit +1, then increases"},
	"Climax":
		{"price": 100, "image": preload("uid://xeir6o5k0rvi"), "description": "Speeds or slows the ball"},
}
static var lvl_3_blocks = {
	"Evolution":
		{"price": 100, "image": preload("uid://clubk07s7j7gl"), "description": "Larger ball"},
	"Mitochondria":
		{"price": 100, "image": preload("uid://bpxaw44j5n2lr"), "description": "Larger paddle"},
	"Gas":
		{"price": 100, "image": preload("uid://fyvpryv0w752"), "description": ""},
	"Cell Division":
		{"price": 100, "image": preload("uid://e6k3x24wplk4"), "description": "+2 balls"},
}
static var lvl_4_blocks = {
	"Census":
		{"price": 100, "image": preload("uid://crt6y1be5akb2"), "description": "+1 point per block already destroyed"},
	"Exploration":
		{"price": 100, "image": preload("uid://b8utte6ls7fgi"), "description": "+1 point to nearby blocks"},
	"President":
		{"price": 100, "image": preload("uid://da7703g6ik0gq"), "description": "+1 life"},
	"Latitude":
		{"price": 100, "image": preload("uid://pbqto63w4j2s"), "description": "+1 point to blocks in a line"},
}
static var lvl_5_blocks = {
	"Paintbrush":
		{"price": 100, "image": preload("uid://drv0k32a46gpc"), "description": ""},
	"Paper Airplane":
		{"price": 100, "image": preload("uid://dey278iwq812v"), "description": "Add shooters to paddle"},
	"Spill":
		{"price": 100, "image": preload("uid://2ap8tst5bm7x"), "description": "Breaks nearby blocks"},
	"Outline":
		{"price": 100, "image": preload("uid://bhjpgqc5xvc6b"), "description": "Spawns temporary ball net"},
}
