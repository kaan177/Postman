extends StaticBody2D

export var Lengte = 5
export var AutoActivate = false

onready var position_2d = $Position2D
onready var sprite = $Sprite
onready var world = get_parent()

var active = false
var rope_end_adjustment = true

func _ready():
	world.connect("WaterMovement", self, "make_a_move")
	if AutoActivate:
		act()
	


func act():
	active = true

func make_a_move():
	if active:
		if not Lengte == 0:
			for index in get_child_count():
				if index > 2:
					var rope_piece = get_child(index)
					rope_piece.position += Vector2(0, 16)
				
				
			
			
			if get_child_count() == 3:
				var Rope_end = preload("res://Objects/Rope Pully/Rope_end piece.tscn").instance()
				Rope_end.set_position(Vector2(3, 14))
				self.add_child(Rope_end)
				Lengte -= 1
			
			else:
				var Rope = preload("res://Objects/Rope Pully/Rope piece.tscn").instance()
				Rope.set_position(Vector2(3, 14))
				self.add_child(Rope)
				Lengte -= 1
				if rope_end_adjustment:
					rope_end_adjustment = false
					get_node("Rope_end Piece").position += Vector2(0, -2)
				
		
		
		if sprite.frame < 4:
			sprite.frame += 1

