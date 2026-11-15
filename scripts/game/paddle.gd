extends CharacterBody2D



func _ready() -> void:
	pass


func _process(delta: float) -> void:
	var direction := Input.get_axis("left", "right")
	var speed = direction * 50
	
	position.x += speed * delta
