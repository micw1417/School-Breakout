extends Control
class_name SellBlock

@export var card_frame: TextureRect
@onready var block_display: TextureRect = $TextureRect/BlockDisplay
@onready var price_tag: Label = $TextureRect/Price
@onready var description: Label = $TextureRect/Description

var hovering: bool

func _ready() -> void:
	Globals.levels_beat = 1
	determine_identity()

func determine_identity():
	randomize()
	match Globals.levels_beat:
		1:
			var random_block = Globals.lvl_1_blocks.keys().pick_random()
			var block_information = Globals.lvl_1_blocks[random_block]
			price_tag.text = str(block_information["price"])
			block_display.texture = block_information["image"]
			description.text = block_information["description"]

func _process(_delta):
	if is_mouse_over_card():
		hovering = true
		card_frame.scale = Vector2(1.2, 1.2)
	else:
		hovering = false
		card_frame.scale = Vector2(1, 1)

# Detects if mouse is over card sprite
func is_mouse_over_card() -> bool:
	var mouse_pos: Vector2 = get_global_mouse_position()
	var sprite_rect = Rect2(card_frame.global_position, card_frame.texture.get_size())
	return sprite_rect.has_point(mouse_pos)

func _input(event) -> void:
# Detects if mouse is hovering and clicks
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		if event.pressed and hovering:
			
			# You can insert additional code here 
			# that does things when the block is bought
			
			#Delete card
			self.queue_free()
