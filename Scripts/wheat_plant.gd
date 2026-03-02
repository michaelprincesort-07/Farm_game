extends Area2D

var day = 0
var collected = false
var can_collect = false
var plant_name = "wheat"
var grid_pos
var grid_key
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$wheat_sprites.frame = 0


func _process(delta: float) -> void:
	
	if day == 1:
		$wheat_sprites.frame = 1
	elif day == 2:
		$wheat_sprites.frame = 2
	elif day == 3:
		$wheat_sprites.frame = 3
		
	if collected:
		queue_free()
		
	
	if $wheat_sprites.frame == 3 and can_collect and Input.is_key_label_pressed(KEY_E):
		collected = true
	

func _on_body_entered(body: Node2D) -> void:
	can_collect = true


func _on_body_exited(body: Node2D) -> void:
	can_collect = false # Replace with function body.
