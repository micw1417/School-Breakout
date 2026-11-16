extends Control
class_name Shop

@export var sell_block: PackedScene
@export var block_container_1: HBoxContainer
@export var block_container_2: HBoxContainer

func _ready() -> void:
	randomize()
	var available_blocks = Globals.lvl_1_blocks.keys()
	available_blocks.shuffle()

# Create 2 sell blocks in 2 rows
	for i in range(2):
		if available_blocks.is_empty(): break
		var sell_block_instance = sell_block.instantiate()
		block_container_1.add_child(sell_block_instance)

	for i in range(2):
		var sell_block_instance = sell_block.instantiate()
		block_container_2.add_child(sell_block_instance)

func shop_transition():
	Globals.is_active = false
	Globals.lives = 3
	get_tree().change_scene_to_file("res://scenes/game/game.tscn")


func _on_button_pressed() -> void:
	pass # Replace with function body.
