extends Sprite2D

var slot = "none"

var amount:int = 0

var amount_is_visible:bool = true

func _on_area_2d_body_entered(node: Node2D) -> void:
	if node.name == "characte_1":
		queue_free()
		get_parent().item_dict["wheat"][0] += 1
