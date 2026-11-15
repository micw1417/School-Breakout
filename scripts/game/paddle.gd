extends CharacterBody2D


var speed = 150
var acceleration = 30

func _ready() -> void:
	Globals.paddle = self


func _process(delta: float) -> void:

	var direction := Input.get_axis("left", "right")
	var target_velocity = direction * speed

	velocity.x = move_toward(
		velocity.x,
		target_velocity,
		acceleration
 	)

	velocity.y = 0

	move_and_slide()
	#move_and_collide(Vector2(move_toward(velocity, speed, acceleration), 0) * delta)
