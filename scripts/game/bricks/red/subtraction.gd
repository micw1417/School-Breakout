extends StaticBody2D
# Subtraction

func _ready() -> void:
	pass

func _process(delta: float) -> void:
	pass

func _on_detection_body_entered(body: Node2D) -> void:
	print(body)
	if (body is Ball):
		Globals.points+=1
		print("entered")
		queue_free()
