extends CharacterBody2D


var speed = 150

func _ready() -> void:
	pass


func _process(delta: float) -> void:

	var direction := Input.get_axis("left", "right")
	velocity = Vector2(direction * speed, 0)

	move_and_collide(velocity * delta)
