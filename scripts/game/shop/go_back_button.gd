extends Button

@onready var animation: AnimationPlayer = $"../TransitionFromGame"

func _on_pressed() -> void:
	animation.play("go_back")
