extends Sprite2D

var slot = "none"

var amount:int = 0

var amount_is_visible:bool = true

func _process(delta: float) -> void:
		$Panel/Label.text = str(amount)


func _on_area_2d_body_entered(node: Node2D) -> void:
	if node.name == "characte_1":
		get_parent().item_dict["tomato"][0] += 1
		queue_free()
		
