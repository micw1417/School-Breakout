extends StaticBody2D

func _ready() -> void:
	pass

func _process(delta: float) -> void:
	pass

func _on_detection_body_entered(body: Node2D) -> void:
	if (body is Ball):
		Globals.points+=1
		queue_free()
		emit_signal("broken")
