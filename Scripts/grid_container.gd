extends GridContainer

var timer = 0

func _ready() -> void:
	self.visible = false 


func _on_chest_chest_opened() -> void:
	while timer < 20000:
		timer += 1
		if timer == 18000:
			self.visible = true
	timer = 0


func _on_chest_close_ui() -> void:
	self.visible = false


func _on_texture_button_pressed() -> void:
	self.visible = false 
