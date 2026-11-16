extends StaticBody2D
# Paper Airplane
signal lives_upped
func _ready() -> void:
	pass

func _process(delta: float) -> void:
	pass

func _on_detection_body_entered(body: Node2D) -> void:
	if body is Ball:
		Globals.points += 1
		Globals.lives += 1

		lives_upped.emit()
		queue_free()
