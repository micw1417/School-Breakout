extends Control
class_name Shop

@export var sell_block: PackedScene
@export var block_container_1: HBoxContainer
@export var block_container_2: HBoxContainer

func _ready() -> void:
 
# Create 2 sell blocks in 2 rows
	for i in range(2):
		var sell_block_instance = sell_block.instantiate()
		block_container_1.add_child(sell_block_instance)

	for i in range(2):
		var sell_block_instance = sell_block.instantiate()
		block_container_2.add_child(sell_block_instance)
