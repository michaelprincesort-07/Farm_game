extends TextureButton

var timer = 0
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	self.visible = false # Replace with function body.


func _on_chest_chest_opened() -> void:
	while timer < 200:
		timer += 1
		if timer == 180:
			self.visible = true
	timer = 0
	 # Replace with function body.


func _on_chest_close_ui() -> void:
	self.visible = false# Replace with function body.
