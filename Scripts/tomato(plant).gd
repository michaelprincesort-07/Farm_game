extends Area2D

var day = 0
var collected = false
var plant_name = "tomato"
var can_collect = false
var grid_pos
var grid_key
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


func _process(delta: float) -> void:
	
	if day == 1:
		$tomato_animation.frame = 1
	elif day == 2:
		$tomato_animation.frame = 2
	elif day == 3:
		$tomato_animation.frame = 3
		
	if collected:
		queue_free()
		
	
	if $tomato_animation.frame == 3 and can_collect and Input.is_key_label_pressed(KEY_E):
		collected = true
	

func _on_body_entered(body: Node2D) -> void:
	can_collect = true


func _on_body_exited(body: Node2D) -> void:
	can_collect = false # Replace with function body.
