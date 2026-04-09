extends Node2D

var Menu_screen = preload("res://ui_start_game.tscn").instantiate()
var Game = preload("res://game.tscn").instantiate()


func _ready() -> void:
	_add_a_scene_manually()


func _process(delta: float) -> void:
	if get_child(-1).start_game == true:
		remove_child(get_child(-1))
		add_child(Game)
	


func _add_a_scene_manually():
	
	add_child(Menu_screen)
