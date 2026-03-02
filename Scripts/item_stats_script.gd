class_name Items extends RefCounted

var amount: int = 0
var max_amount: int = 99
var item_name = "Item"

func _init(name: String = "Item", initial_amount: int = 0, cap = 99):
	self.item_name = name
	self.amount = initial_amount
	self.max_amount = cap
	print("Item stats initialized for: " + item_name)
	
func item_collected():
	self.amount += 1

func item_used():
	self.amount -= 1
	
