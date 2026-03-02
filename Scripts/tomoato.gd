extends Area2D

var pickup = false


var player: PackedScene = preload("res://characte_1.tscn")
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass 
	


func _on_body_entered(node: Node2D) -> void:
	print("collected")
	get_parent().queue_free()
