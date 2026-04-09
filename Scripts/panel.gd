extends Panel



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if int($Label.text) != 0 and get_parent().amount_is_visible:
		self.visible = true
	else:
		self.visible = false 
	
