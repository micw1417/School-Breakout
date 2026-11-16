extends Node

static var paddle = null
static var ball = null
static var points : int
static var levels_beat := 0
static var is_active := false
static var lives: = 3
static var currentLevel := Levels.ENGLISH
static var WINS := 0

enum Levels {
	ENGLISH,
	HISTORY,
	MATH,
	SCIENCE,
	ART
}
const ALPHABET_BLOCK = preload("res://scenes/bricks/alphabet_block.tscn")
const BASE_BRICK = preload("res://scenes/bricks/base_brick.tscn")

var blocks := [[ BASE_BRICK, BASE_BRICK, BASE_BRICK, BASE_BRICK, BASE_BRICK, BASE_BRICK],
				[BASE_BRICK, ALPHABET_BLOCK, BASE_BRICK, BASE_BRICK, BASE_BRICK, BASE_BRICK],
				[BASE_BRICK, BASE_BRICK, BASE_BRICK, BASE_BRICK, BASE_BRICK, BASE_BRICK],
				[BASE_BRICK, BASE_BRICK, BASE_BRICK, BASE_BRICK, BASE_BRICK, BASE_BRICK]]
#blocks_invintory
static var lvl_1_blocks = {
	"Multiplication":
		{"price": 10, "image": preload("uid://cse58se1avw7w"), "description": "Enlarges your paddle"},
	"Addition":
		{"price": 10, "image": preload("uid://dda7vbsju4nav"), "description": "Spawns another ball"},
	"Subtraction":
		{"price": 10, "image": preload("uid://c8ioqvhg3bmco"), "description": "Spawns a ghost block"},
	"Division":
		{"price": 10, "image": preload("uid://da5mhjofb63o0"), "description": "Smaller paddle, faster ball"},
}
static var lvl_2_blocks = {
	"Analogy":
		{"price": 10, "image": preload("uid://ffio3jdajph4"), "description": "Spawns another block"},
	"Alphabet":
		{"price": 10, "image": preload("uid://7ytuh1vwmi84"), "description": "+1 point per alphabet block"},
	"Essay Draft":
		{"price": 10, "image": preload("uid://cgj61hamdhwe1"), "description": "First hit +1, then increases"},
	"Climax":
		{"price": 10, "image": preload("uid://xeir6o5k0rvi"), "description": "Speeds or slows the ball"},
}
static var lvl_3_blocks = {
	"Evolution":
		{"price": 10, "image": preload("uid://clubk07s7j7gl"), "description": "Larger ball"},
	"Mitochondria":
		{"price": 10, "image": preload("uid://bpxaw44j5n2lr"), "description": "Larger paddle"},
	"Gas":
		{"price": 10, "image": preload("uid://fyvpryv0w752"), "description": ""},
	"Cell Division":
		{"price": 10, "image": preload("uid://e6k3x24wplk4"), "description": "+2 balls"},
}
static var lvl_4_blocks = {
	"Census":
		{"price": 10, "image": preload("uid://crt6y1be5akb2"), "description": "+1 point per block already destroyed"},
	"Exploration":
		{"price": 10, "image": preload("uid://b8utte6ls7fgi"), "description": "+1 point to nearby blocks"},
	"President":
		{"price": 10, "image": preload("uid://da7703g6ik0gq"), "description": "+1 life"},
	"Latitude":
		{"price": 10, "image": preload("uid://pbqto63w4j2s"), "description": "+1 point to blocks in a line"},
}
static var lvl_5_blocks = {
	"Paintbrush":
		{"price": 10, "image": preload("uid://drv0k32a46gpc"), "description": ""},
	"Paper Airplane":
		{"price": 10, "image": preload("uid://dey278iwq812v"), "description": "Add shooters to paddle"},
	"Spill":
		{"price": 10, "image": preload("uid://2ap8tst5bm7x"), "description": "Breaks nearby blocks"},
	"Outline":
		{"price": 10, "image": preload("uid://bhjpgqc5xvc6b"), "description": "Spawns temporary ball net"},
}

# Red blocks
const RED_ADDITION = preload("uid://dy1didh4k1okl")
const RED_DIVISION = preload("uid://dco6ya7d4ghdo")
const RED_MULTIPLICATION = preload("uid://hnwf4lnswyy2")
const RED_SUBTRACTION = preload("uid://lmt7fp63ee7k")
# Blue blocks
const BLUE_ALPHABET = preload("uid://cqb8n1dsfcnis")
const BLUE_ANALOGY = preload("uid://byhel3rfs5lr6")
const BLUE_CLIMAX = preload("uid://24ggm68vso3t")
const BLUE_ESSAY_DRAFT = preload("uid://dkttbvkm2lle")
# Green blocks
const GREEN_CELL_DIVISION = preload("uid://ccylun3gmstme")
const GREEN_EVOLUTION = preload("uid://b87y1yfao7swk")
const GREEN_GAS = preload("uid://dj58m8nsf3dau")
const GREEN_MITOCHONDRIA = preload("uid://04smye01f1u8")
# Orange blocks
const ORANGE_CENSUS = preload("uid://x0qgxb4gp6xg")
const ORANGE_EXPLORATION = preload("uid://08i5aa0h0xgl")
const ORANGE_LATITUDE = preload("uid://t5wytocabgr1")
const ORANGE_PRESIDENT = preload("uid://ij88bvnia8lg")
# Purple blocks
const PURPLE_OUTLINE = preload("uid://beh1e5yjm50da")
const PURPLE_PAINTBRUSH = preload("uid://csxx4ththl44e")
const PURPLE_PAPER_AIRPLANE = preload("uid://570u4pn0c6ym")
const PURPLE_SPILL = preload("uid://cfs5j1i3igll1")

const MEGA_ARRAY = [
	preload("uid://dy1didh4k1okl"), # RED_ADDITION
	preload("uid://dco6ya7d4ghdo"), # RED_DIVISION
	preload("uid://hnwf4lnswyy2"), # RED_MULTIPLICATION
	preload("uid://lmt7fp63ee7k"), # RED_SUBTRACTION
	preload("uid://cqb8n1dsfcnis"), # BLUE_ALPHABET
	preload("uid://byhel3rfs5lr6"), # BLUE_ANALOGY
	preload("uid://24ggm68vso3t"), # BLUE_CLIMAX
	preload("uid://dkttbvkm2lle"), # BLUE_ESSAY_DRAFT
	preload("uid://ccylun3gmstme"), # GREEN_CELL_DIVISION
	preload("uid://b87y1yfao7swk"), # GREEN_EVOLUTION
	preload("uid://dj58m8nsf3dau"), # GREEN_GAS
	preload("uid://04smye01f1u8"), # GREEN_MITOCHONDRIA
	preload("uid://x0qgxb4gp6xg"), # ORANGE_CENSUS
	preload("uid://08i5aa0h0xgl"), # ORANGE_EXPLORATION
	preload("uid://t5wytocabgr1"), # ORANGE_LATITUDE
	preload("uid://ij88bvnia8lg"), # ORANGE_PRESIDENT
	preload("uid://beh1e5yjm50da"), # PURPLE_OUTLINE
	preload("uid://csxx4ththl44e"), # PURPLE_PAINTBRUSH
	preload("uid://570u4pn0c6ym"), # PURPLE_PAPER_AIRPLANE
	preload("uid://cfs5j1i3igll1"), # PURPLE_SPILL
]
