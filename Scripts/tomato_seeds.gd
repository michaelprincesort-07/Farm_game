extends Area2D

var amount:int = 0

var slot = "none"

var amount_is_visible:bool = true

func _process(delta: float) -> void:
	
	$Panel/Label.text = str(amount)
