extends CanvasLayer

var start_game = false

func _ready() -> void:
	pass # Replace with function body.
	

func _on_texture_button_pressed() -> void:
	print(get_tree())
	get_tree().quit()
	

func _on_play_button_button_down() -> void:
	start_game = true
