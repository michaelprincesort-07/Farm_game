extends RigidBody2D


func _ready() -> void:
	gravity_scale = 0


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_key_pressed(KEY_P):
		pass
