extends StaticBody2D
# Addition

func _ready() -> void:
	pass

func _process(delta: float) -> void:
	pass

func _on_detection_body_entered(body: Node2D) -> void:
	print(body)
	if (body is Ball):
		var ball_preload = preload("res://scenes/game/ball.tscn")
		var ball_instance = ball_preload.instantiate()
		add_sibling(ball_instance)
		ball_instance.global_position = self.global_position
		
		Globals.points+=1
		print("entered")
		queue_free()
