extends Sprite2D

var inventory: Inventory = Inventory.new()


func _ready() -> void:
	#inventory.add_item("axe",1,load("res://icon.svg"))
	print(inventory.items)
	self.texture = inventory.items["axe"][1]
	
	
	
