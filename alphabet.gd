extends StaticBody2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


	
func _on_detection_body_entered(body: Node2D) -> void:
	print(body)
	if (body is Ball):
		queue_free() 
		Globals.points+=1
		# Spawn temp balls after that expire after like 2 sec?
		print("entered")
		
		
