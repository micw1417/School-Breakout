extends RigidBody2D
class_name Ball
var speed = 150
var velocity = Vector2(speed * 1, speed)
var velocity_direction := Vector2(1, -1).normalized()
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass
func _input(event: InputEvent) -> void:
	if ( Input.is_action_just_pressed("start")):
		Globals.is_active = true
func _physics_process(delta):
	if (Globals.is_active):
		var collision = move_and_collide(velocity_direction * speed * delta)

		if collision:
			velocity_direction = velocity_direction.bounce(
				collision.get_normal()
			)
