extends RigidBody2D
class_name Ball
var speed = 100
var velocity_direction := Vector2(1, -1).normalized()
var is_active = true
var velocity = Vector2(speed * -1, speed)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	var collision = move_and_collide(velocity_direction * speed * delta)

	if collision:
		velocity_direction = velocity_direction.bounce(
			collision.get_normal()
		)
