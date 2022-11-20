extends Node2D

onready var Level = get_owner()

func _ready():
	Level.connect("WaterMovement", self, "move_water")
	

func move_water():
	for i in get_child_count():
		print("lol")
		get_child(i).make_a_move()


func make_water(direction, Position):
	var water = preload("res://Objects/Water.tscn").instance()
	water.set_position(Position)
	water.Vector = direction
	self.add_child(water)
