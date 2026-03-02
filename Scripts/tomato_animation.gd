extends AnimatedSprite2D



func _ready() -> void:
	pass


func _process(delta: float) -> void:
	if frame == 3:
		print("harvest")
