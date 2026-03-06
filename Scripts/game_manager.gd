extends Node2D

var Menu_screen = preload("res://ui_start_game.tscn").instantiate()

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Main.visible = false
	_add_a_scene_manually()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if get_child(-1).start_game == true:
		remove_child(get_child(-1))
		$Main.visible = true


func _add_a_scene_manually():
	
	add_child(Menu_screen)
