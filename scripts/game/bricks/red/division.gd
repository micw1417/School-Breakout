extends StaticBody2D
# Division

func _ready() -> void:
	pass

func _process(delta: float) -> void:
	pass

func _on_detection_body_entered(body: Node2D) -> void:
	print(body)
	if (body is Ball):
		Globals.paddle.scale = Vector2(0.75, 1.0)
		Globals.paddle.speed = 225
		
		Globals.points+=1
		print("entered")
		queue_free()
