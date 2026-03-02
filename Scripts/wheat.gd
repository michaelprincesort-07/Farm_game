extends Sprite2D

var slot = "none"


func _on_area_2d_body_entered(node: Node2D) -> void:
	if node.name == "characte_1":
		queue_free()
		node.items["wheat"] += 1
