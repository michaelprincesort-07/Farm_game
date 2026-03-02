extends AnimatedSprite2D

var chicken
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	chicken = get_parent()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	play(chicken.animation)
	
