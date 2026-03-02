extends Camera2D

@export var player = Node2D
@export var sprite_bar = Node2D

func _ready() -> void:
	sprite_bar.visible = true# Replace with function body.


func _process(delta: float) -> void:
	position = position.lerp(player.position,0.08)
	pass
	
	
