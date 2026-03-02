extends AnimatedSprite2D

var close = false
# Called when the node enters the scene tree for the first time.

# Called every frame. 'delta' is the elapsed time since the previous frame.

func _on_chest_chest_opened() -> void:
	close = true # Replace with function body.



func _on_area_2d_body_exited(body: Node2D) -> void:
	if close:
		self.play_backwards("open")
		close = false # Replace with function body.


func _on_chest_play_chest_animation() -> void:
	self.play("open") # Replace with function body.


func _on_chest_button_pressed() -> void:
	close = false
	self.play_backwards("open")
	 # Replace with function body.
